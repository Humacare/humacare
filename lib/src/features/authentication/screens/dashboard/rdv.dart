import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({
    Key? key,
      }): super(key: key);
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime ? _selectedDate= DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Sélectionner une date'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_selectedDate != null) {
                      saveDataToFirestore();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erreur'),
                            content: Text('Veuillez sélectionner une date.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> saveDataToFirestore() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final date = _selectedDate;

    // Vérifier le nombre de sélections pour la date choisie
    final int selectionsCount = await getSelectionsCountForDate(date!);

    if (selectionsCount < 10) {
      try {
        await FirebaseFirestore.instance.collection('rdv').add({
          'nom': name,
          'description': description,
          'date': date,
        });

        _nameController.clear();
        _descriptionController.clear();
        setState(() {
          _selectedDate = null;
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succès'),
              content: Text('Les données ont été enregistrées avec succès.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text(
                  'Une erreur s\'est produite lors de l\'enregistrement des données.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Le nombre maximum de sélections pour cette date a été atteint.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  /*Future<void> saveDataToFirestore() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final date = _selectedDate;

    try {
      await FirebaseFirestore.instance.collection('rdv').add({
        'nom': name,
        'description': description,
        'date': date,
      });

      _nameController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedDate = null;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Succès'),
            content: Text('Les données ont été enregistrées avec succès.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text(
                'Une erreur s\'est produite lors de l\'enregistrement des données.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }*/

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      // Vérifier le nombre de sélections pour la date choisie
      final int selectionsCount = await getSelectionsCountForDate(pickedDate);

      if (selectionsCount < 10) {
        setState(() {
          _selectedDate = pickedDate;
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Le nombre maximum de sélections pour cette date a été atteint.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }



  Future<int> getSelectionsCountForDate(DateTime date) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('date_selections')
        .where('date', isEqualTo: date)
        .get();

    return snapshot.docs.length;
  }

 Future<void> updateSelectionsCountForDate(DateTime date, int count) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('date_selections')
        .where('date', isEqualTo: date)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final docId = snapshot.docs[0].id;
      final docRef = FirebaseFirestore.instance.collection('date_selections').doc(docId);

      await docRef.update({'selection_count': count});
    } else {
      await FirebaseFirestore.instance.collection('date_selections').add({
        'date': date,
        'selection_count': count,
      });
    }
  }


/*if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }*/
  }


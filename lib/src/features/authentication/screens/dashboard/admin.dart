import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panneau d\'administration'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('rdv').snapshots(),
        builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
            ) {
          if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
              snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (
                BuildContext context,
                int index,
                ) {
              final data = documents[index].data();
              final String? name = data['nom'];
              final String? description = data['description'];
              final Timestamp? timestamp = data['date'];

              if (name != null && description != null && timestamp != null) {
                final DateTime date = timestamp.toDate();

                return ListTile(
                  title: Text(name),
                  subtitle: Text(description),
                  trailing: Text(intl.DateFormat.yMMMd().format(date)),
                );
              } else {
                return ListTile(
                  title: Text('Données invalides'),
                );
              }
            },
          );
        },
      ),
    );
  }
}



/**import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({
    Key? key,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panneau d\'administration'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rdv').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          // Données récupérées depuis Firestore
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final data = documents[index].data() as Map<String, dynamic>;
              final String name = data['nom'];
              final String description = data['description'];
              final Timestamp timestamp = data['date'];
              final DateTime date = timestamp.toDate();

             if (name != null && description != null && timestamp != null) {
                final DateTime date = timestamp.toDate();

              return ListTile(
                title: Text(name),
                subtitle: Text(description),
                trailing: Text(intl.DateFormat.yMMMd().format(date)),

                // trailing: Text(date.toString()),
              );}
             else {
               return ListTile(
                 title: Text('Données invalides'),
               );
             }
            },
          );
        },
      ),
    );
  }
}*/
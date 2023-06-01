import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:memoire/src/constants/colors.dart';
import 'package:memoire/src/features/authentication/screens/dashboard/rdv.dart';

//import '../../../../common widgets/form/formulaire.dart';




class AppointScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      color : Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/doctor1.jpg"),
                  fit: BoxFit.cover,

                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ) ,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      pcolor.withOpacity(0.9),
                      pcolor.withOpacity(0),
                      pcolor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_back,
                                  color: pcolor,
                                  size: 28,

                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F8FF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite_outline,
                                color: pcolor,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ) ,
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Patients",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: wcolor,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "1.8K",
                                style: TextStyle(
                                  color: wcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: wcolor,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "3 Years",
                                style: TextStyle(
                                  color: wcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rating",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: wcolor,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "4.9",
                                style: TextStyle(
                                  color: wcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr Lassissi",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: pcolor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.heartPulse,
                        color: Colors.red,
                        size: 28,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Surgeon",
                        style: TextStyle(
                          fontSize: 17,
                          color: bcolor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Le médecin est un professionnel qui s'occupe "
                        "du diagnostic, du traitement et de la "
                        "biologiques et sur les sciences humaines",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: bcolor.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Book Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: bcolor.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only (right: 20, top: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular (10),
                      color:  tSecondaryColor,
                    ),
                    /*child: IconButton (onPressed: () {

                    } , icon: const Image (image: AssetImage(tWelcomeScreenImage))),*/ // IconButton
                  ) ,
                  /*SizedBox(height: 4),
                  Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index){
                        return
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal:8, vertical: 5 ),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                              decoration: BoxDecoration(
                                color: index==1? pcolor: Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${index + 8}",
                                    style: TextStyle(
                                      color: index == 1 ? wcolor: bcolor.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    "JANV",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: index == 1 ? wcolor: bcolor.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          );
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Book Time",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: bcolor.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index){
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal:8, vertical: 5 ),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            color: index==2 ? pcolor: Color(0xFFF2F8FF),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "${index + 8}: 00 AM",
                              style: TextStyle(
                                fontSize: 17,
                                color: index == 2? wcolor: bcolor.withOpacity(0.6),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),*/
                  SizedBox(height: 20),
                  Material(
                    color: pcolor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                           builder: (context)=>MyFormWidget(),
                        ));
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                              color: wcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),


                          ),
                        ),

                      ),

                    ),

                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin');
                    },
                    child: Text('Panneau d\'administration'),
                  ),

                ],
              ) ,
            ),
          ],

        ),



      ),
    );
  }
}
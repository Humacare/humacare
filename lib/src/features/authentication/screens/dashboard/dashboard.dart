import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:memoire/src/features/authentication/screens/profile/profilescreen.dart';
//import 'package:memoire/src/features/authentication/screens/dashboard/doctor_section.dart';
import '../../../../constants/colors.dart';
import 'doctor_section.dart';

class HomeScreen extends StatelessWidget{
  List catNames = [
    "Dental",
    "Heart",
    "Eye",
    "Brain",
    "Ear",
  ];
  List<Icon> caticons= [
    Icon(MdiIcons.toothOutline, color:pcolor, size:30),
    Icon(MdiIcons.heartPlus, color:pcolor, size:30),
    Icon(MdiIcons.eye, color:pcolor, size:30),
    Icon(MdiIcons.brain, color:pcolor, size:30),
    Icon(MdiIcons.earHearing, color:pcolor, size:30),

  ];

  HomeScreen({super.key});
   //const HomeScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pcolor.withOpacity(0.8),
                    pcolor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),

            ),
            Padding(
              padding:EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.account_box),
                              onPressed: () => Get.to(() => const ProfileScreen()),

                              //backgroundImage: AssetImage("Assets/Images/doctor1.jpg"),
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: wcolor,
                              size: 30,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Huma Care",
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Your Healt Is Our\nFirst Priority",
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 25,
                            fontWeight:FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: wcolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: bcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: catNames.length,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5, horizontal:15),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF2F8FF),
                                    shape: BoxShape.circle,
                                    boxShadow:[ BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                    ]
                                ),
                                child: Center(
                                  child: caticons[index],
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                catNames[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: bcolor.withOpacity(0.7),
                                ),
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child:
                    Text(
                      "Recommended Doctors",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: bcolor.withOpacity(0.7),
                      ),
                    ),
                  ),


                  DoctorSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

}
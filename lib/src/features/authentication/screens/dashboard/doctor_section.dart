import 'package:flutter/material.dart';
import 'package:memoire/src/constants/colors.dart';
import 'package:memoire/src/features/authentication/screens/dashboard/appoint.dart';


class DoctorSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 340,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index){
          return Column(
            children: [
              Container(
                height: 250,
                width: 150,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F8FF),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> AppointScreen(),
                            ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image(
                              image: AssetImage("assets/images/doc/doc${index + 1}.jpg"),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ]
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite_outline,
                                color: pcolor,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr Lassissi",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: pcolor,
                            ),
                          ),
                          Text(
                            "surgeon",
                            style: TextStyle(
                              fontSize: 18,
                              color: pcolor.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "4.8",
                                style: TextStyle(fontSize: 15, color: bcolor.withOpacity(0.6),),
                              ),
                              SizedBox(width: 20),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
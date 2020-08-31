import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyBgColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: BackButton(color: kSoftBlueColor),
        title: Text('Profile', style: TextStyle(fontSize: 18, color: kBlackColor, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              child: Text(
                'EDIT',
                  style: TextStyle(fontSize: 16, color: kPurpleColor, fontWeight: FontWeight.bold)
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: kWhiteColor,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:Border.all(width: 4, color: kShadowBlueColor)
                    ),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: kSoftBlueColor,
                      backgroundImage: AssetImage('assets/images/user-img.jpg'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 170,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('4', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: kPurpleColor)),
                                SizedBox(height: 5),
                                Text('Donated', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kBlackColor)),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('125', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: kPurpleColor)),
                                SizedBox(height: 5),
                                Text('Requests', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kBlackColor)),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.favorite_border, size: 25, color: kPurpleColor),
                                SizedBox(height: 5),
                                Text('25', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kBlackColor)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFFF2156),
                                    const Color(0xFFFF4D4D),
                                  ]
                                )
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.star, color: kWhiteColor, size: 20),
                                  SizedBox(width: 5),
                                  Text('HERO DONOR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kWhiteColor)),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: kBorderGreyColor, width: 2)
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text('MY ACCOUNT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: kPurpleColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: kWhiteColor,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: kBorderGreyColor, size: 20),
                      SizedBox(width: 10),
                      Text('Dhaka, Bangladesh', style: TextStyle(fontSize: 12, color: kBlackColor, fontWeight: FontWeight.w500))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      maxLines: 5,
                      style: TextStyle(fontSize: 12, color: kSoftBlueColor, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              color: kWhiteColor,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('MY ACTIVITY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add_circle_outline, color: kPurpleColor),
                        Text('Post Update', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kPurpleColor)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              color: kWhiteColor,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: kPurpleColor,
                          backgroundImage: AssetImage('assets/images/user-img.jpg'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Jym Ben', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time, color: kBorderGreyColor, size: 16,),
                                SizedBox(width: 5),
                                Text('6m age', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kBorderGreyColor)),
                                SizedBox(width: 15),
                                Icon(Icons.location_on, color: kBorderGreyColor, size: 16,),
                                SizedBox(width: 5),
                                Text('Mubmai', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kBorderGreyColor)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/donate-blood.png', width: MediaQuery.of(context).size.width, height: 290, fit: BoxFit.cover),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.favorite_border, size: 20),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(width: 1, color: kGreyColor)
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '87434',
                              style: TextStyle(
                                  color: kBorderGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.share, size: 20),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(width: 1, color: kGreyColor)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem',
                          style: TextStyle(
                              color: kTextGreyColor,
                              fontSize: 12
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

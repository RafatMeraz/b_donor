import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/ui/explore_all_donors.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kGreyBgColor,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF215D),
                    const Color(0xFFFF4D4D),
                  ]
                )
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    if (_scaffoldKey.currentState.isDrawerOpen)
                    _scaffoldKey.currentState.openEndDrawer();
                    else {
                      _scaffoldKey.currentState.openDrawer();
                    }
                  },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/images/nav-logo.png',
                          width: 18, height: 14, fit: BoxFit.cover),
                    )),
                Text(
                  'B Donor',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: kWhiteColor,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFFFF215D),
              const Color(0xFFFF4D4D),
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xFFFF215D),
                const Color(0xFFFF4D4D),
              ])),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left :20.0, right :15.0, top:20.0, bottom:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('120966', style: TextStyle(fontSize: 22, color: kWhiteColor)),
                              Text('Donors', style: TextStyle(fontSize: 14, color: kWhiteColor)),
                            ],
                          ),
                          RoundedRaisedButton(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ExploreAllDonors()
                              ));
                            },
                            backgroundColor: kWhiteColor,
                            text: 'FIND DONOR',
                            textColor: kPurpleColor,
                            imageLink: null,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left :20.0, right :15.0, top:20.0, bottom:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('20976', style: TextStyle(fontSize: 22, color: kWhiteColor)),
                              Text('Request', style: TextStyle(fontSize: 14, color: kWhiteColor)),
                            ],
                          ),
                          SizedBox(width: 30),
                          RoundedRaisedButton(
                            onTap: (){},
                            backgroundColor: kWhiteColor,
                            text: 'SEE REQUEST',
                            textColor: kPurpleColor,
                            imageLink: null,
                          )
                        ],
                      ),
                    ),
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
                  Text('EXPLORE LATEST FEED', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
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

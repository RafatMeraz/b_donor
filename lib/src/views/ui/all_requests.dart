import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/ui/add_new_request.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class AllRequests extends StatelessWidget {
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
                BackButton(color: kWhiteColor),
                Text(
                  'All Request',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
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
            Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xFFFF215D),
                          const Color(0xFFFF4D4D),
                        ])),
                  ),
                ),
                Column(
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
                                Text('New Request', style: TextStyle(fontSize: 14, color: kWhiteColor)),
                              ],
                            ),
                            RoundedRaisedButton(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewRequest()));
                              },
                              backgroundColor: kWhiteColor,
                              text: 'ADD REQUEST',
                              textColor: kPurpleColor,
                              imageLink: 'assets/images/add_btn.png',
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      color: kWhiteColor,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/images/user-img.jpg'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Robin Doz',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kBlackColor
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on, size: 18, color: kBorderGreyColor),
                                        SizedBox(width: 10),
                                        Text(
                                          'Singapore',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RoundedBorderedRaisedButtonSmall(
                                      backgroundColor: kWhiteColor,
                                      onTap: (){},
                                      imageLink: null,
                                      textColor: kPurpleColor,
                                      text: 'Response',
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 4, top: 4, bottom: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:  Radius.circular(10)),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFFFF215D),
                                            const Color(0xFFFF4D4D),
                                          ]
                                        )
                                      ),
                                      child: Text(
                                        'Requested',
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 10,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'A+',
                                          style: TextStyle(
                                              color: kPurpleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(width: 1, color: kBorderGreyColor)
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
                    SizedBox(height: 10),
                    Container(
                      color: kWhiteColor,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/images/user-img.jpg'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Robin Doz',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kBlackColor
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on, size: 18, color: kBorderGreyColor),
                                        SizedBox(width: 10),
                                        Text(
                                          'Singapore',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RoundedBorderedRaisedButtonSmall(
                                      backgroundColor: kWhiteColor,
                                      onTap: (){},
                                      imageLink: null,
                                      textColor: kPurpleColor,
                                      text: 'Response',
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 4, top: 4, bottom: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:  Radius.circular(10)),
                                          gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFFFF215D),
                                                const Color(0xFFFF4D4D),
                                              ]
                                          )
                                      ),
                                      child: Text(
                                        'Requested',
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'A+',
                                          style: TextStyle(
                                              color: kPurpleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(width: 1, color: kBorderGreyColor)
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
                    SizedBox(height: 10),
                    Container(
                      color: kWhiteColor,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/images/user-img.jpg'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Robin Doz',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kBlackColor
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on, size: 18, color: kBorderGreyColor),
                                        SizedBox(width: 10),
                                        Text(
                                          'Singapore',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RoundedBorderedRaisedButtonSmall(
                                      backgroundColor: kWhiteColor,
                                      onTap: (){},
                                      imageLink: null,
                                      textColor: kPurpleColor,
                                      text: 'Response',
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 4, top: 4, bottom: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:  Radius.circular(10)),
                                          gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFFFF215D),
                                                const Color(0xFFFF4D4D),
                                              ]
                                          )
                                      ),
                                      child: Text(
                                        'Requested',
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'A+',
                                          style: TextStyle(
                                              color: kPurpleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(width: 1, color: kBorderGreyColor)
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
                    SizedBox(height: 10),
                    Container(
                      color: kWhiteColor,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/images/user-img.jpg'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Robin Doz',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kBlackColor
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on, size: 18, color: kBorderGreyColor),
                                        SizedBox(width: 10),
                                        Text(
                                          'Singapore',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RoundedBorderedRaisedButtonSmall(
                                      backgroundColor: kWhiteColor,
                                      onTap: (){},
                                      imageLink: null,
                                      textColor: kPurpleColor,
                                      text: 'Response',
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 4, top: 4, bottom: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:  Radius.circular(10)),
                                          gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFFFF215D),
                                                const Color(0xFFFF4D4D),
                                              ]
                                          )
                                      ),
                                      child: Text(
                                        'Requested',
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'A+',
                                          style: TextStyle(
                                              color: kPurpleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(width: 1, color: kBorderGreyColor)
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
                    SizedBox(height: 10),
                    Container(
                      color: kWhiteColor,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/images/user-img.jpg'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Robin Doz',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kBlackColor
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on, size: 18, color: kBorderGreyColor),
                                        SizedBox(width: 10),
                                        Text(
                                          'Singapore',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RoundedBorderedRaisedButtonSmall(
                                      backgroundColor: kWhiteColor,
                                      onTap: (){},
                                      imageLink: null,
                                      textColor: kPurpleColor,
                                      text: 'Response',
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 4, top: 4, bottom: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:  Radius.circular(10)),
                                          gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFFFF215D),
                                                const Color(0xFFFF4D4D),
                                              ]
                                          )
                                      ),
                                      child: Text(
                                        'Requested',
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'A+',
                                          style: TextStyle(
                                              color: kPurpleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(width: 1, color: kBorderGreyColor)
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
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

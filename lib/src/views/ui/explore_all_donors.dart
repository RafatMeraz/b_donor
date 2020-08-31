import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class ExploreAllDonors extends StatefulWidget {
  @override
  _ExploreAllDonorsState createState() => _ExploreAllDonorsState();
}

class _ExploreAllDonorsState extends State<ExploreAllDonors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyBgColor,
      appBar: AppBar(
        leading: BackButton(color: kPurpleColor),
        backgroundColor: kWhiteColor,
        title: Text('Explore all donors', style: TextStyle(fontSize: 17, color: kBlackColor)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list, color: kPurpleColor, size: 24),
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              color: kWhiteColor,
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
                            RoundedBorderedRaisedButton(
                              backgroundColor: kWhiteColor,
                              onTap: (){},
                              imageLink: null,
                              textColor: kPurpleColor,
                              text: 'Ask For Help',
                            )
                          ],
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
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF3643),
                          const Color(0xFFFF4383),
                        ]
                      )
                    ),
                    child: Text(
                      'Last date of donation 23 Jun 2018',
                      style: TextStyle(
                        fontSize: 12,
                        color: kWhiteColor
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: kWhiteColor,
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
                            RoundedBorderedRaisedButton(
                              backgroundColor: kWhiteColor,
                              onTap: (){},
                              imageLink: null,
                              textColor: kPurpleColor,
                              text: 'Ask For Help',
                            )
                          ],
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: kWhiteColor,
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
                            RoundedBorderedRaisedButton(
                              backgroundColor: kWhiteColor,
                              onTap: (){},
                              imageLink: null,
                              textColor: kPurpleColor,
                              text: 'Ask For Help',
                            )
                          ],
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
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFF3643),
                              const Color(0xFFFF4383),
                            ]
                        )
                    ),
                    child: Text(
                      'Last date of donation 23 Jun 2018',
                      style: TextStyle(
                          fontSize: 12,
                          color: kWhiteColor
                      ),
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

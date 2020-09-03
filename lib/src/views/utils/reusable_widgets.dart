import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/ui/user_profile.dart';

import 'contants.dart';

class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton({@required this.text,
    @required this.textColor,
    @required this.imageLink,
    @required this.onTap,
    @required this.backgroundColor});

  final Function onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 190,
        child: RaisedButton(
          elevation: 4,
          color: backgroundColor,
          onPressed: onTap,
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 12,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}

class RoundedBorderedRaisedButton extends StatelessWidget {
  RoundedBorderedRaisedButton({@required this.text,
    @required this.textColor,
    @required this.imageLink,
    @required this.onTap,
    @required this.backgroundColor});

  final Function onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: kBorderGreyColor, width: 1)),
        color: backgroundColor,
        onPressed: onTap,
        child: imageLink == null
            ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            ))
            : Row(
          children: <Widget>[
            Image.asset(imageLink,
                fit: BoxFit.scaleDown, width: 22, height: 22),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedBorderedRaisedButtonSmall extends StatelessWidget {
  RoundedBorderedRaisedButtonSmall({@required this.text,
    @required this.textColor,
    @required this.imageLink,
    @required this.onTap,
    @required this.backgroundColor});

  final Function onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: kBorderGreyColor, width: 1)),
        color: backgroundColor,
        onPressed: onTap,
        child: imageLink == null
            ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            ))
            : Row(
          children: <Widget>[
            Image.asset(imageLink,
                fit: BoxFit.scaleDown, width: 22, height: 22),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedGradientColorButton extends StatelessWidget {
  RoundedGradientColorButton({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kPurpleColor,
            gradient: LinearGradient(colors: [
              const Color(0xFFFF2156),
              const Color(0xFFFF4D4D),
            ]),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  RoundedTextField({@required this.hint,
    @required this.controller,
    @required this.textInputType});

  final String hint;
  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
          fontSize: 14,
          color: kBlackColor,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w400),
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fillColor: kGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: '$hint',
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

showErrorToast(String message) {
  BotToast.showText(
      text: message,
      borderRadius: BorderRadius.circular(30),
      contentColor: kDarkPurpleColor,
      textStyle: TextStyle(color: kWhiteColor));
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    @required this.userName,
    @required this.gender,
    @required this.userImage,
    @required this.location,
    @required this.image,
    @required this.descriptions,
    @required this.time,
    @required this.reacts,
  });

  final String userName, gender, userImage, location, image, descriptions, time;
  final int reacts;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  backgroundImage: userImage == null
                      ? gender == 'Male' ? AssetImage(
                      'assets/images/user-boy.png')
                      : AssetImage('assets/images/user-img.jpg') : NetworkImage(
                      IMG_BASE_URL + userImage),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child: Text('$userName',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfile()));
                      },
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: kBorderGreyColor,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text('${time.split(' ')[1]}    ${time.split(' ')[0]}',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: kBorderGreyColor)),
                        SizedBox(width: 15),
                        Icon(
                          Icons.location_on,
                          color: kBorderGreyColor,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text('$location',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: kBorderGreyColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          image == null
              ? Container()
              : Image.network(image,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 290,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  '$descriptions',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: kTextGreyColor, fontSize: 12),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border, size: 20),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: kGreyColor)),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$reacts',
                      style: TextStyle(
                          color: kBorderGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.share, size: 20),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: kGreyColor)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    @required this.message,
    @required this.id,
    @required this.name,
    @required this.time,
    @required this.image,
    @required this.ignoreFunction,
    @required this.gender,
    @required this.responseFunction,
  });

  final String image, time, message, name, gender;
  final int id;
  final Function ignoreFunction, responseFunction;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: kWhiteColor,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: image == null ? gender == 'Male' ?
                          AssetImage('assets/images/user-boy.png') : AssetImage(
                              'assets/images/user-girl.png') :
                          NetworkImage(IMG_BASE_URL + image)
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '$name',
                            style: TextStyle(fontSize: 14, color: kBlackColor),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Icon(Icons.access_time,
                                  size: 18, color: kBorderGreyColor),
                              SizedBox(width: 10),
                              Text(
                                '${time.split(' ')[1]}    ${time.split(
                                    ' ')[0]}',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '$message',
                            style: TextStyle(fontSize: 10, color: kBlackColor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.all(0),
                    children: <Widget>[
                      FlatButton(
                        child: Text('Ignore'),
                        onPressed: () {
                          ignoreFunction(id, 2);
                        },
                        textColor: kBorderGreyColor,
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(width: 10),
                      FlatButton(
                        child: Text('Response'),
                        onPressed: () {
                          responseFunction(id, 1);
                        },
                        textColor: kDarkPurpleColor,
                        padding: EdgeInsets.all(8),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5),
    ]);
  }
}

import 'package:flutter/material.dart';

import 'contants.dart';

class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton(
      {@required this.text,
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
            )
          ),
        ),
      ),
    );
  }
}

class RoundedBorderedRaisedButton extends StatelessWidget {
  RoundedBorderedRaisedButton(
      {@required this.text,
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
            side: BorderSide(color: kBorderGreyColor, width: 1)
        ),
        color: backgroundColor,
        onPressed: onTap,
        child: imageLink == null ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            )
        ) :  Row(
          children: <Widget>[
            Image.asset(imageLink, fit: BoxFit.scaleDown, width: 22, height: 22),
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
  RoundedBorderedRaisedButtonSmall(
      {@required this.text,
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
            side: BorderSide(color: kBorderGreyColor, width: 1)
        ),
        color: backgroundColor,
        onPressed: onTap,
        child: imageLink == null ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            )
        ) :  Row(
          children: <Widget>[
            Image.asset(imageLink, fit: BoxFit.scaleDown, width: 22, height: 22),
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
  RoundedTextField({@required this.hint, @required this.controller});
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
          fontSize: 14,
          color: kBlackColor,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fillColor: kGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide:
          BorderSide.none,
        ),
        hintText: '$hint',
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide:
          BorderSide.none,
        ),
      ),
    );
  }
}
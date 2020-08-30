import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: RaisedButton(
          elevation: 4,
          color: backgroundColor,
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: imageLink == null
                ? Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w400),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset(imageLink),
                ),
                SizedBox(width: 20),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
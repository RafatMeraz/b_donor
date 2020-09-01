import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class PostActivity extends StatefulWidget {
  @override
  _PostActivityState createState() => _PostActivityState();
}

class _PostActivityState extends State<PostActivity> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        leading: BackButton(color: kPurpleColor),
        title: Text('Post New Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kBlackColor)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text('Address Preference', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              RoundedTextField(
                controller: null,
                hint: 'Address',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 30),
              Text('Select Image', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('No image selected'),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30),),
                          gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFF2156),
                            const Color(0xFFFF4D4D),
                          ]
                        )
                      ),
                      child: Text('SELECT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kWhiteColor)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text('Activity Description', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              Container(
                height: 300,
                child: TextField(
                  controller: null,
                  selectionHeightStyle: BoxHeightStyle.max,
                  maxLines: 10000,
                  style: TextStyle(
                      color: kBlackColor
                  ),
                  decoration: InputDecoration(
                    fillColor: kGreyColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Write your description here',
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                        color: Colors.black38
                    ),
                    labelStyle: TextStyle(
                        color: Colors.black54
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  ),
                ),
              ),
              SizedBox(height: 40),
              RoundedGradientColorButton(
                text: 'SUBMIT',
                onTap: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}

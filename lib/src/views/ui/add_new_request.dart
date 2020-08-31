import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class AddNewRequest extends StatefulWidget {
  @override
  _AddNewRequestState createState() => _AddNewRequestState();
}

class _AddNewRequestState extends State<AddNewRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        leading: BackButton(color: kPurpleColor),
        title: Text('Request for Blood', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kBlackColor)),
      ),
      body: Container(
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
            ),
            SizedBox(height: 20),
            Text('Blood for', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
            SizedBox(height: 10),
            RoundedTextField(
              controller: null,
              hint: 'Blood for',
            )
          ],
        ),
      ),
    );
  }
}

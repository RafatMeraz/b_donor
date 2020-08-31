import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class AddNewRequest extends StatefulWidget {
  @override
  _AddNewRequestState createState() => _AddNewRequestState();
}

class _AddNewRequestState extends State<AddNewRequest> {
  String _donorBloodGroup = 'A+';

  final bloodGroups = ["A+", "A-", "B-", "B+", "O+", "O-", "AB-", "AB+"];

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
              ),
              SizedBox(height: 30),
              Text('Blood for', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              RoundedTextField(
                controller: null,
                hint: 'Blood for',
              ),
              SizedBox(height: 30),
              Text('Select Blood Group',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(height: 15),
              GroupButton(
                spacing: 5,
                isRadio: true,
                direction: Axis.horizontal,
                onSelected: (index, isSelected) =>
                _donorBloodGroup = bloodGroups[index],
                buttons: bloodGroups,
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
                unselectedTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
                selectedColor: kPurpleColor,
                unselectedColor: kWhiteColor,
                selectedBorderColor: kPurpleColor,
                unselectedBorderColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(0),
                selectedShadow: <BoxShadow>[
                  BoxShadow(color: Colors.transparent)
                ],
                unselectedShadow: <BoxShadow>[
                  BoxShadow(color: Colors.transparent)
                ],
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

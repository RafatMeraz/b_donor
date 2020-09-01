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
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 30),
              Text('Blood for', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              RoundedTextField(
                controller: null,
                hint: 'Father, mother or friend',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 30),
              Text('Amount', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              RoundedTextField(
                controller: null,
                hint: 'Maximum 10 units',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 30),
              Text('Contact', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlackColor)),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '+8801',
                        style: TextStyle(
                            fontSize: 14,
                            color: kBlackColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14,
                          color: kBlackColor,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: kGreyColor,
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          borderSide:
                          BorderSide.none,
                        ),
                        hintText: 'Enter your phone number',
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:organize_flutter_project/src/views/ui/home.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class BecomeDonor extends StatefulWidget {
  @override
  _BecomeDonorState createState() => _BecomeDonorState();
}

class _BecomeDonorState extends State<BecomeDonor> {
  bool isGenderMale = true, isVisible = false;
  String _donorBloodGroup;

  final bloodGroups = ["A+", "A-", "B-", "B+", "O+", "O-", "AB-", "AB+"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          title: Text('Become Donor',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor)),
          backgroundColor: kWhiteColor,
          leading: BackButton(
            color: kPurpleColor,
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(
                      fontSize: 14,
                      color: kBlackColor,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: kGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent),
                    ),
                    hintText: 'Name',
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 14,
                      color: kBlackColor,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: kGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent),
                    ),
                    hintText: 'E-Mail',
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Gender',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          isGenderMale = true;
                        });
                      },
                      child: isGenderMale
                          ? Image.asset('assets/images/male-selected.png',
                              fit: BoxFit.scaleDown, width: 48, height: 69)
                          : Image.asset('assets/images/male-normal.png'),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 2,
                      height: 38,
                      color: kBorderGreyColor,
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isGenderMale = false;
                        });
                      },
                      child: !isGenderMale
                          ? Image.asset('assets/images/famale-selected.png',
                              fit: BoxFit.scaleDown, width: 48, height: 69)
                          : Image.asset('assets/images/female-normal.png'),
                    )
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
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Checkbox(
                      value: isVisible,
                      checkColor: kWhiteColor,
                      activeColor: kBlackColor,
                      onChanged: (val) {
                        setState(() {
                          isVisible = val;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Do you want to make your contact number visible for other',
                        style: TextStyle(color: kBlackColor, fontSize: 14),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                RoundedGradientColorButton(
                  text: 'DONE',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                )
              ],
            ),
          ),
        ));
  }
}


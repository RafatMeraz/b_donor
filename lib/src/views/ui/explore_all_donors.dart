import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:organize_flutter_project/src/business_logic/models/donor_model.dart';
import 'package:organize_flutter_project/src/business_logic/services/repository.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class ExploreAllDonors extends StatefulWidget {
  @override
  _ExploreAllDonorsState createState() => _ExploreAllDonorsState();
}

class _ExploreAllDonorsState extends State<ExploreAllDonors> {
  bool inProgress = false;
  DonorModel _donorModel;

  @override
  void initState() {
    super.initState();
    getAllDonors();
  }

  getAllDonors() async {
    setState(() {
      inProgress = true;
    });
    var _response = await repository.getAllDonor();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      _donorModel = _response.object;
      setState(() {
        inProgress = false;
      });
    } else {
      setState(() {
        inProgress = false;
      });
      showErrorToast(_response.object);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyBgColor,
      appBar: AppBar(
        leading: BackButton(color: kPurpleColor),
        backgroundColor: kWhiteColor,
        title: Text('Explore all donors',
            style: TextStyle(fontSize: 17, color: kBlackColor)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list, color: kPurpleColor, size: 24),
            onPressed: () {},
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        color: Colors.black87,
        progressIndicator: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: kPurpleColor,
          ),
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            backgroundColor: kWhiteColor,
            valueColor: AlwaysStoppedAnimation<Color>(kBlackColor),
          ),
        ),
        child: _donorModel == null
            ? Center(child: Text('Loading..'))
            : _donorModel.donors.length == 0
                ? Center(child: Text('No donor available now!'))
                : ListView.builder(
                  itemCount: _donorModel.donors.length,
          itemBuilder: (context, index){
                    return _donorModel.donors[index].id == UserData.userId ? Container() : DonorCard(
                      donor: _donorModel.donors[index],
                    );
          },
        ),
      ),
    );
  }

}
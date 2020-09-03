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

enum Operation {
  CANCEL, REQUEST
}

class _ExploreAllDonorsState extends State<ExploreAllDonors> {
  bool inProgress = false;
  DonorModel _donorModel;
  TextEditingController _messageController;
  String _message;
  Operation _operation;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    getAllDonors();
  }

  // get all donors from api
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

  // ask for help
  askForHelp(int id) async {
    _messageController = TextEditingController(text: '');
    _message = '';
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(margin: EdgeInsets.only(left: 16),
                        child: Text('Send a request message',
                            style: TextStyle(
                                fontSize: 14, color: kBlackColor))),
                    SizedBox(height: 10),
                    RoundedTextField(
                      controller: _messageController,
                      textInputType: TextInputType.text,
                      hint: 'Message',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){
                            Navigator.pop(context);
                            _operation = Operation.CANCEL;
                          },
                          child: Text('CANCEL', style: TextStyle(color: kBorderGreyColor)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            _message = _messageController.text.trim();
                            _operation = Operation.REQUEST;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 16),
                            width: 100,
                            decoration: BoxDecoration(
                                color: kPurpleColor,
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFFF2156),
                                  const Color(0xFFFF4D4D),
                                ]),
                                borderRadius: BorderRadius.circular(
                                    30)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
    if (_operation == Operation.REQUEST) {
      setState(() {
        inProgress = true;
      });
      var _response = await repository.askForHelp(id, _message);
      if (_response.id == ResponseCode.SUCCESSFUL) {
        setState(() {
          inProgress = false;
        });
        showSuccessToast('Request sent!');
      } else {
        setState(() {
          inProgress = false;
        });
        showErrorToast(_response.object);
      }
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
                    itemBuilder: (context, index) {
                      return _donorModel.donors[index].id == UserData.userId
                          ? Container()
                          : DonorCard(
                        requestToDonor: askForHelp,
                              donor: _donorModel.donors[index],
                            );
                    },
                  ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:organize_flutter_project/src/business_logic/models/request_model.dart';
import 'package:organize_flutter_project/src/business_logic/services/repository.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/ui/add_new_request.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class AllRequests extends StatefulWidget {
  @override
  _AllRequestsState createState() => _AllRequestsState();
}

class _AllRequestsState extends State<AllRequests> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<RequestCard> requestList = List();
  RequestModel _requestModel;
  bool inProgress = false;

  getAllRequest() async {
    setState(() {
      inProgress = true;
    });
    var _response = await repository.getAllRequest();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      _requestModel = _response.object;
      requestList.clear();
      _requestModel.requests.forEach((element) {
        requestList.add(RequestCard(
            id: element.request.id,
            user: element.user,
            bloodType: element.request.bloodType,
            bloodGroup: element.request.bloodGroup,
            location: element.request.address,
            responseFunction: () {}));
      });
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
      key: _scaffoldKey,
      backgroundColor: kGreyBgColor,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xFFFF215D),
                const Color(0xFFFF4D4D),
              ])),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BackButton(color: kWhiteColor),
                Text(
                  'All Request',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: kWhiteColor,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFFFF215D),
              const Color(0xFFFF4D4D),
            ]),
          ),
        ),
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        const Color(0xFFFF215D),
                        const Color(0xFFFF4D4D),
                      ])),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 15.0, top: 20.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                      _requestModel == null
                                          ? '00'
                                          : _requestModel.totalRequests
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 22, color: kWhiteColor)),
                                  Text('New Request',
                                      style: TextStyle(
                                          fontSize: 14, color: kWhiteColor)),
                                ],
                              ),
                              RoundedRaisedButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddNewRequest(getAllRequest)));
                                },
                                backgroundColor: kWhiteColor,
                                text: 'ADD REQUEST',
                                textColor: kPurpleColor,
                                imageLink: 'assets/images/add_btn.png',
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      _requestModel == null ? Container() : Column(
                        children: requestList,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    getAllRequest();
  }
}


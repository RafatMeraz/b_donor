import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:organize_flutter_project/src/business_logic/models/home_model.dart';
import 'package:organize_flutter_project/src/business_logic/models/notification_model.dart';
import 'package:organize_flutter_project/src/business_logic/services/hive_services/hive_services.dart';
import 'package:organize_flutter_project/src/business_logic/services/repository.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/ui/all_requests.dart';
import 'package:organize_flutter_project/src/views/ui/diet_chart.dart';
import 'package:organize_flutter_project/src/views/ui/explore_all_donors.dart';
import 'package:organize_flutter_project/src/views/ui/login_register.dart';
import 'package:organize_flutter_project/src/views/ui/post_activity.dart';
import 'package:organize_flutter_project/src/views/ui/profile.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool donorMode = false, inProgress = false, isVisible = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeModel _homeModel;
  List<Column> cards = List();
  List<NotificationCard> notificationsList = List();
  NotificationModel _notificationModel;

  @override
  void initState() {
    super.initState();
    getAllHomeData();
  }

  // get all home data from api
  getAllHomeData() async {
    setState(() {
      inProgress = true;
    });
    var _response = await repository.getHomeData();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      _homeModel = _response.object;
      donorMode = _homeModel.donorMode == 1;
      cards.clear();
      _homeModel.recentActivities.forEach((element) {
        cards.add(Column(
          children: <Widget>[
            ActivityCard(
              id: element.activity.id,
              reactionFunction: reactToActivity,
              gender: element.user.gender,
              userImage: element.user.image,
              userName: element.user.name,
              descriptions: element.activity.description,
              image: element.activity.image,
              location: element.activity.address,
              reacts: element.reacts,
              time: element.activity.time,
              state: element.state,
            ),
            SizedBox(height: 5),
          ],
        ));
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

  // get all home data from api
  getAllNotifications() async {
    setState(() {
      isVisible = true;
    });
    var _response = await repository.getAllNotifications();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      _notificationModel = _response.object;
      notificationsList.clear();
      _notificationModel.requests.forEach((element) {
        notificationsList.add(NotificationCard(
            id: element.request.id,
            gender: element.user.gender,
            message: element.request.message,
            name: element.user.name,
            time: element.request.time,
            image: element.user.image,
            ignoreFunction: responseToNotification,
            responseFunction: responseToNotification));
      });
      setState(() {
        isVisible = false;
      });
    } else {
      setState(() {
        isVisible = false;
      });
      showErrorToast(_response.object);
    }
  }

  // get all home data from api
  responseToNotification(int requestId, int response) async {
    setState(() {
      isVisible = true;
    });
    var _response = await repository.responsePersonalNotifications(requestId, response);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      setState(() {
        isVisible = false;
      });
      Navigator.of(context).pop();
      getAllHomeData();
    } else {
      setState(() {
        isVisible = false;
      });
      showErrorToast(_response.object);
    }
  }

  // react to a activity
  reactToActivity(int id) async {
    setState(() {
      inProgress = true;
    });
    var _response = await repository.reactToActivity(id);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      getAllHomeData();
    } else {
      setState(() {
        isVisible = false;
      });
      showErrorToast(_response.object);
    }
  }

  // change user mode from api
  changeUserMode(int mode) async {
    setState(() {
      inProgress = true;
    });
    var _response = await repository.changeDonorMode(mode);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      setState(() {
        donorMode = !donorMode;
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
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('B Donor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kWhiteColor)),
                    SizedBox(height: 5),
                    Text('Donate and Save Life',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: kWhiteColor)),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xFFFF215D),
                const Color(0xFFFF4D4D),
              ])),
            ),
            ListTile(
              leading: Icon(Icons.invert_colors, color: kPurpleColor, size: 20),
              title: Text('Donor Mode'),
              trailing: Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: kDarkPurpleColor,
                  trackColor: kSoftBlueColor,
                  value: donorMode,
                  onChanged: (val) {
                    changeUserMode(val ? 1 : 0);
                  },
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: kPurpleColor, size: 20),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.fitness_center, color: kPurpleColor, size: 20),
              title: Text('Exercise Guidelines'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.fastfood, color: kPurpleColor, size: 20),
              title: Text('Diet Chart'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DietChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_in_talk, color: kPurpleColor, size: 20),
              title: Text('Emergency Help'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.live_help, color: kPurpleColor, size: 20),
              title: Text('About'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: kPurpleColor, size: 20),
              title: Text('Log out'),
              onTap: () {
                HiveServices.logOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginRegister()));
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
                InkWell(
                    onTap: () {
                      if (_scaffoldKey.currentState.isDrawerOpen)
                        _scaffoldKey.currentState.openEndDrawer();
                      else {
                        _scaffoldKey.currentState.openDrawer();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/images/nav-logo.png',
                          width: 18, height: 14, fit: BoxFit.cover),
                    )),
                Text(
                  'B Donor',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Badge(
                    badgeContent: Text(
                      _homeModel == null
                          ? ''
                          : _homeModel.totalNotifications.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    badgeColor: Colors.amber,
                    child: Icon(
                      Icons.notifications,
                      color: kWhiteColor,
                    ),
                  ),
                  onPressed: () async{
                    await getAllNotifications();
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return _notificationModel == null
                              ? Visibility(
                                  visible: isVisible,
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : _notificationModel.requests.length == 0 ? Center(child: Text('No new notifications!')) : Column(
                            children: notificationsList,
                          );
                        });
                  },
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  const Color(0xFFFF215D),
                  const Color(0xFFFF4D4D),
                ])),
                child: Column(
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
                                    _homeModel == null
                                        ? '00'
                                        : _homeModel.totalDonor.toString(),
                                    style: TextStyle(
                                        fontSize: 22, color: kWhiteColor)),
                                Text('Donors',
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
                                            ExploreAllDonors()));
                              },
                              backgroundColor: kWhiteColor,
                              text: 'FIND DONOR',
                              textColor: kPurpleColor,
                              imageLink: null,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                                    _homeModel == null
                                        ? '00'
                                        : _homeModel.totalRequest.toString(),
                                    style: TextStyle(
                                        fontSize: 22, color: kWhiteColor)),
                                Text('Request',
                                    style: TextStyle(
                                        fontSize: 14, color: kWhiteColor)),
                              ],
                            ),
                            SizedBox(width: 30),
                            RoundedRaisedButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllRequests()));
                              },
                              backgroundColor: kWhiteColor,
                              text: 'SEE REQUEST',
                              textColor: kPurpleColor,
                              imageLink: null,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                color: kWhiteColor,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('EXPLORE LATEST FEED',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostActivity(getHomeData: getAllHomeData)));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add_circle_outline, color: kPurpleColor),
                          Text('Post Update',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kPurpleColor)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              _homeModel == null
                  ? Container()
                  : _homeModel.recentActivities.length == 0
                      ? Container()
                      : Column(
                          children: cards,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:organize_flutter_project/src/business_logic/models/notification_model.dart';
import 'package:organize_flutter_project/src/business_logic/services/repository.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({@required this.refreshHome});
  final Function refreshHome;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool inProgress = false;
  List<NotificationCard> notificationsList = List();
  NotificationModel _notificationModel;

  // get all home data from api
  getAllNotifications() async {
    if (mounted) {
      setState(() {
        inProgress = true;
      });
    }
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
      if (mounted) {
        setState(() {
          inProgress = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          inProgress = false;
        });
      }
      showErrorToast(_response.object);
    }
  }

  // get all home data from api
  responseToNotification(int requestId, int response) async {
    if (mounted) {
      setState(() {
        inProgress = true;
      });
    }
    removeNotification(requestId);
    var _response = await repository.responsePersonalNotifications(requestId, response);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      if (mounted) {
        setState(() {
          inProgress = false;
        });
      }
      Navigator.of(context).pop();
    } else {
      if (mounted) {
        setState(() {
          inProgress = false;
        });
      }
      showErrorToast(_response.object);
    }
  }

  // remove a notification
  removeNotification(int id) {
    _notificationModel.requests.removeWhere((index) => index.request.id == id);
    notificationsList.removeWhere((index) => index.id == id);
    print(notificationsList.length);
    widget.refreshHome();
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kWhiteColor,
          leading: BackButton(color: kPurpleColor),
          title: Text('Notifications',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: kBlackColor)),
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
          child: Column(
            children: notificationsList,
          ),
        ));
  }
}

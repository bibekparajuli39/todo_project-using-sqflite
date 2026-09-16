import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:todo_project/service/local_notification_service.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({super.key});

  @override
  State<LocalNotification> createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  // Connectivity checking
  String status = 'Checking....';
  // Connectivity checking
  String getConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi)) {
      return "Wifi Connected";
    } else if (result.contains(ConnectivityResult.mobile)) {
      return "Mobile Connected";
    } else {
      return 'No Connection';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('local ')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Connectivity().onConnectivityChanged.listen((result) {
                setState(() {
                  status = getConnectionStatus(result);
                });
              });
            },
            child: Text('Check Connectivity'),
          ),
          Text(status),

          ElevatedButton(
            onPressed: () {
              callNotification(
                title: 'Bibek',
                body:
                    'hello bibek i am happy and good to see ujlndfkgndfkngkfnbkfngkfn/g',
              );
            },
            child: Text('Local Notification'),
          ),

          ElevatedButton(
            onPressed: () {
              FirebaseCrashlytics.instance.crash();
            },
            child: Text('show error'),
          ),
        ],
      ),
    );
  }
}

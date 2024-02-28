import 'dart:io';

import 'package:lb_planner/shared/domain/domain.dart';

/// Implementation of [ConnectionService] that uses the [InternetAddress.lookup] method.
class InternetAdressLookupConnectionService extends ConnectionService {
  @override
  Future<bool> checkConnection() async {
    log("Checking connection status");

    var addresses = await InternetAddress.lookup("google.com");

    var status =
        (addresses.isNotEmpty && addresses.first.rawAddress.isNotEmpty);

    if (status) {
      log("Device is connected to the internet");
    } else {
      log("Device is not connected to the internet");
    }

    return status;
  }
}

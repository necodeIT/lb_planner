import 'dart:io';

import 'connection_service.dart';

/// Implementation of [ConnectionService] that uses the [InternetAddress.lookup] method.
class InternetAdressLookupConnectionService extends ConnectionService {
  @override
  Future<bool> checkConnection() async {
    var addresses = await InternetAddress.lookup("google.com");

    return (addresses.isNotEmpty && addresses.first.rawAddress.isNotEmpty);
  }
}

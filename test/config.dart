import 'package:lb_planner/features/update/update.dart';

const kUnitTestsMockoonPort = 3000;

const kUnitTestsMockoonAddress = "http://localhost:$kUnitTestsMockoonPort";

final kReleaseDownloads = ReleaseDownloads(
  windows: "http://localhost:5000/installers/windows",
  linux: "http://localhost:5000/installers/linux",
  macos: "http://localhost:5000/installers/macos",
);

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppInit {
  Future<void> appInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init("${appDocumentDirectory.path}/dictionary");

    await EasyLocalization.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}

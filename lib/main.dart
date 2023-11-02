import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MaterialApp(
        home: LoginScreen(),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    ),
  );
}

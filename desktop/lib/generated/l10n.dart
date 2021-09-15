// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Something went wrong!`
  String get guard_someThingWentWrong {
    return Intl.message(
      'Something went wrong!',
      name: 'guard_someThingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Send Report`
  String get guard_sendReport {
    return Intl.message(
      'Send Report',
      name: 'guard_sendReport',
      desc: '',
      args: [],
    );
  }

  /// `Ingore`
  String get guard_ingore {
    return Intl.message(
      'Ingore',
      name: 'guard_ingore',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settings_language {
    return Intl.message(
      'Language',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get settings_themes {
    return Intl.message(
      'Themes',
      name: 'settings_themes',
      desc: '',
      args: [],
    );
  }

  /// `You already are up to date!`
  String get settings_upToDate {
    return Intl.message(
      'You already are up to date!',
      name: 'settings_upToDate',
      desc: '',
      args: [],
    );
  }

  /// `Clear Cache`
  String get settings_clearCache {
    return Intl.message(
      'Clear Cache',
      name: 'settings_clearCache',
      desc: '',
      args: [],
    );
  }

  /// `Delete Profile`
  String get settings_deleteProfile {
    return Intl.message(
      'Delete Profile',
      name: 'settings_deleteProfile',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get settings_credits {
    return Intl.message(
      'Credits',
      name: 'settings_credits',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

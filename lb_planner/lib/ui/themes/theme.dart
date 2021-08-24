import 'package:flutter/material.dart';

// ignore: camel_case_types
class NcTheme {
  NcTheme(
      {required Color primaryColor,
      required Color secondaryColor,
      required Color tertiaryColor,
      required Color accentColor,
      required Color textColor,
      Color? buttonTextColor,
      Color? pendingColor,
      Color? lateColor,
      Color? uploadedColor,
      Color? doneColor}) {
    this._primaryColor = primaryColor;
    this._secondaryColor = secondaryColor;
    this._tertiaryColor = tertiaryColor;
    this._accentColor = accentColor;
    this._textColor = textColor;
    this._buttonTextColor = buttonTextColor ?? textColor;

    this._doneColor = doneColor ?? _doneColor;
    this._uploadedColor = uploadedColor ?? _uploadedColor;
    this._lateColor = lateColor ?? _lateColor;
    this._pendingColor = pendingColor ?? _pendingColor;
  }

  late Color _primaryColor;
  late Color _secondaryColor;
  late Color _tertiaryColor;
  late Color _accentColor;
  late Color _textColor;
  late Color _buttonTextColor;

  late Color _doneColor = Color(0xFF4FB930);
  late Color _uploadedColor = Color(0xFFF1C40F);
  late Color _lateColor = Color(0xFFE74C3C);
  late Color _pendingColor = Color(0xFF7F8C8D);

  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;
  Color get tertiaryColor => _tertiaryColor;
  Color get accentColor => _accentColor;
  Color get textColor => _textColor;
  Color get buttonTextColor => _buttonTextColor;
  Color get pendingColor => _pendingColor;
  Color get lateColor => _lateColor;
  Color get uploadedColor => _uploadedColor;
  Color get doneColor => _doneColor;
}

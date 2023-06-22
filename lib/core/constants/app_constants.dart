// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class ApplicationConstants {
  static String baseURL = "https://fakestoreapi.com";
  static const _locale = Locale('tr', 'TR');
  static const _fallbackLocale = Locale('en', 'US');

  Locale get locale => _locale;
  Locale get fallbackLocale => _fallbackLocale;

  static const EMAIL_REGEX = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const PASSWORD_REGEX = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,16}$';
}
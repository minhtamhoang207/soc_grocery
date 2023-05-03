import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatDateTypeWeekDay(DateTime? date) {
    if (date != null) {
      return DateFormat('EEEE, M/d/y').format(date);
    } else {
      return '';
    }
  }

  static bool isEmail(String email) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(email);
  }

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String formatCurrency(int value) {
    final format = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return format.format(value);
  }
}
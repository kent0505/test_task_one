import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'models/note.dart';

bool newFirst = true;
bool pincode = false;
String pincodeTxt = '1234';

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();

  newFirst = prefs.getBool('newFirst') ?? true;
  pincode = prefs.getBool('pincode') ?? false;
  pincodeTxt = prefs.getString('pincodeTxt') ?? '1234';

  log('newFirst = $newFirst');
  log('pincode = $pincode');
  log('pincodeTxt = $pincodeTxt');
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

String getCurrentTimestamp() {
  DateTime now = DateTime.now();
  int timestamp = now.millisecondsSinceEpoch ~/ 1000;
  return timestamp.toString();
}

String formatDate(String timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(timestamp) * 1000,
  );
  final formatter = DateFormat('dd.MM.yyyy');
  return formatter.format(dateTime);
}

String formatTime(String timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(timestamp) * 1000,
  );
  String timeString = DateFormat.Hm().format(dateTime);
  return timeString;
}

String formatToWeekday(String timestamp) {
  initializeDateFormatting();
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(timestamp) * 1000,
  );
  String weekdayName = DateFormat.E('ru').format(dateTime);
  return weekdayName;
}

String formatToDay(String timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(timestamp) * 1000,
  );
  String dayOfMonth = DateFormat('dd').format(dateTime);
  return dayOfMonth;
}

String formatToMonth(String timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(timestamp) * 1000,
  );
  String monthName = DateFormat.MMM('ru').format(dateTime);
  return monthName;
}

List<Note> sortNotes(List<Note> notes) {
  List<Note> sortedNotes = [];

  if (newFirst) {
    for (Note note in notes) {
      if (!note.pinned) {
        sortedNotes.add(note);
      }
    }
    for (Note note in notes) {
      if (note.pinned) {
        sortedNotes.add(note);
      }
    }
    return sortedNotes.reversed.toList();
  } else {
    for (Note note in notes) {
      if (note.pinned) {
        sortedNotes.add(note);
      }
    }
    for (Note note in notes) {
      if (!note.pinned) {
        sortedNotes.add(note);
      }
    }
    return sortedNotes;
  }
}

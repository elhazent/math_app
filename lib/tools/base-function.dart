import 'package:flutter/material.dart';
import 'dart:math' as math;

class BaseFunction{
  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static shortMonthName(int val, {bool short = true}) {
    if(val == 1) return short ? 'Jan' : 'Januari';
    if(val == 2) return short ? 'Feb' : 'Februari';
    if(val == 3) return short ? 'Mar' : 'Maret';
    if(val == 4) return short ? 'Apr' : 'April';
    if(val == 5) return short ? 'Mei' : 'Mei';
    if(val == 6) return short ? 'Jun' : 'Juni';
    if(val == 7) return short ? 'Jul' : 'Juli';
    if(val == 8) return short ? 'Ags' : 'Agustus';
    if(val == 9) return short ? 'Sep' : 'September';
    if(val == 10) return short ? 'Okt' : 'Oktober';
    if(val == 11) return short ? 'Nov' : 'November';
    if(val == 12) return short ? 'Des' : 'Desember';
  }

  static shortDayName(String day) {
    if(day == "Monday") return 'Senin';
    if(day == "Tuesday") return 'Selasa';
    if(day == "Wednesday") return 'Rabu';
    if(day == "Thursday") return 'Kamis';
    if(day == "Friday") return 'Jumat';
    if(day == "Saturday") return 'Sabtu';
    if(day == "Sunday") return 'Minggu';
  }

  static milliToShortDate(int millisec) {
    if(millisec ==0 || millisec ==null) return "Tanggal tidak tersedia";
    DateTime src = DateTime.fromMillisecondsSinceEpoch(millisec);
    var year = src.year; var mon = shortMonthName(src.month); var day = src.day;
    return '$day $mon $year';
  }

  static milliToLongDate(int millisec) {
    if(millisec ==0) return "Tanggal tidak tersedia";
    DateTime src = DateTime.fromMillisecondsSinceEpoch(millisec);
    var year = src.year; var mon = shortMonthName(src.month,short: false); var day = src.day;
    return '$day $mon $year';
  }



  static milliToFormatyyyyMMDD(int millisec) {
    if(millisec ==0) return "Tanggal tidak tersedia";
    DateTime src = DateTime.fromMillisecondsSinceEpoch(millisec);
    String newDay;
    String newMonth;
    var year = src.year; var mon = src.month; var day = src.day;
    if (day < 10){
      newDay = "0${day}";
    } else {
      newDay = day.toString();
    }
    if (mon < 10){
      newMonth = "0${mon}";
    } else {
      newMonth = mon.toString();
    }
    print(newDay);
    return '$year-$newMonth-$newDay';
  }

  static milliToShortTime(int millisec) {
    if(millisec ==0) return "Jam tidak tersedia";
    DateTime src = DateTime.fromMillisecondsSinceEpoch(millisec);
    var hour = src.hour; var mint = src.minute;
    var newmin = "${mint}";
    if (mint < 10){
      newmin = "0${mint}";
    }
    return '$hour:$newmin';
  }

  static milliToShortTimeMinute(int millisec) {
    if(millisec ==0) return "Jam tidak tersedia";
    DateTime src = DateTime.fromMillisecondsSinceEpoch(millisec);
    var mint = src.minute;
    return mint;
  }




}
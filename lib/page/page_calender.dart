import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';

import '../tools/tools.dart';

class PageCalender extends StatefulWidget {
  const PageCalender({super.key});

  @override
  State<PageCalender> createState() => _PageCalenderState();
}

class _PageCalenderState extends State<PageCalender> {

  String? timeString, strKota, subTime, strHijriYear, strHijriMonth;

  String getHijriFullDate() {
    var hijriCalendar = HijriCalendar.now();
    strHijriYear = hijriCalendar.hYear.toString();
    strHijriMonth = hijriCalendar.hMonth.toString();

    return "${hariNames[hijriCalendar.wkDay]!}, ${hijriCalendar.hDay} ${bulanNames[hijriCalendar.hMonth]!} ${hijriCalendar.hYear}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          getHijriFullDate(),
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 480,
          child: IslamicHijriCalendar(
            isHijriView: true,
            highlightBorder: Colors.blue,
            defaultBorder: Colors.blue.withOpacity(0.1),
            highlightTextColor: Colors.white,
            defaultTextColor: Colors.blue,
            defaultBackColor: Colors.white,
            adjustmentValue: 0,
            isGoogleFont: false,
            getSelectedEnglishDate: (selectedDate) {},
            getSelectedHijriDate: (selectedDate) {},
            isDisablePreviousNextMonthDates: true,
          ),
        ),
      ),
    );
  }
}

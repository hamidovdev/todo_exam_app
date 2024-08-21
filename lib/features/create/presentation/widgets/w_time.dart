// ignore_for_file: prefer_interpolation_to_compose_strings, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/widgets/w_textfield.dart';

class WDateTimer extends StatefulWidget {
  final Callback success;
  final String hintText;
  final DateTime? time;
  const WDateTimer({
    super.key,
    required this.success,
    required this.hintText,
    this.time,
  });

  @override
  _WDateTimerState createState() => _WDateTimerState();
}

//
//
//   DateTimePicker widgetini qo'lda yasashga qiynalganim uchun malum bir qismlarini ChatGpt dan foydalandim!
//
//

class _WDateTimerState extends State<WDateTimer> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: widget.time != null
          ? "${widget.time!.year} - ${widget.time!.month < 10 ? "0${widget.time!.month}" : widget.time!.month}-${widget.time!.day < 10 ? "0${widget.time!.day}" : widget.time!.day} - ${widget.time!.hour < 10 ? "0${widget.time!.hour}" : widget.time!.hour}:${widget.time!.minute < 10 ? "0${widget.time!.minute}" : widget.time!.minute}"
          : "",
    );
    _controller.addListener(_formatDateTime);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _formatDateTime() {
    String input = _controller.text.replaceAll(RegExp(r'\D'), '');

    if (input.length > 4) {
      input = input.substring(0, 4) + '-' + input.substring(4);
    }
    if (input.length > 7) {
      input = input.substring(0, 7) + '-' + input.substring(7);
    }
    if (input.length > 10) {
      input = input.substring(0, 10) + '-' + input.substring(10);
    }
    if (input.length > 13) {
      input = input.substring(0, 13) + ':' + input.substring(13);
    }

    if (input.length >= 16) {
      String year = input.substring(0, 4);
      String month = input.substring(5, 7);
      String day = input.substring(8, 10);
      String hour = input.substring(11, 13);
      String minute = input.substring(14, 16);

      // Validate year
      int yearInt = int.parse(year);
      if (yearInt < 1950 || yearInt > 2950) {
        year = '1950';
      }

      // Validate month
      int monthInt = int.parse(month);
      if (monthInt < 1 || monthInt > 12) {
        month = '01';
      }

      // Validate day
      int dayInt = int.parse(day);
      int maxDay = _daysInMonth(yearInt, monthInt);
      if (dayInt < 1 || dayInt > maxDay) {
        day = '01';
      }

      // Validate hour
      int hourInt = int.parse(hour);
      if (hourInt < 0 || hourInt > 23) {
        hour = '00';
      }

      // Validate minute
      int minuteInt = int.parse(minute);
      if (minuteInt < 0 || minuteInt > 59) {
        minute = '00';
      }

      String formatted = '$year - $month-$day - $hour:$minute';
      _controller.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
      widget.success(
        DateTime(
          int.parse(year),
          int.parse(month),
          int.parse(day),
          int.parse(hour),
          int.parse(minute),
        ),
      );
    } else {
      _controller.value = TextEditingValue(
        text: input,
        selection: TextSelection.collapsed(offset: input.length),
      );
    }
  }

  int _daysInMonth(int year, int month) {
    if (month == 2) {
      if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        return 29;
      }
      return 28;
    }
    if (month == 4 || month == 6 || month == 9 || month == 11) {
      return 30;
    }
    return 31;
  }

  @override
  Widget build(BuildContext context) {
    return WTextField(
      hintText: widget.hintText,
      hintTextStyle: context.styles.fontSz16Weight400ColorGrey1,
      contentPadding: const EdgeInsets.all(10),
      focusNode: FocusNode(),
      textInputAction: widget.hintText == "Start Time"
          ? TextInputAction.next
          : TextInputAction.done,
      controller: _controller,
      keyBoardType: TextInputType.number,
      textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: context.styles.fontSz14Weight600ColorDark1,
      hasBorderColor: false,
    );
  }
}

// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/routes_name/route_names.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/core/widgets/w_button.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:todo_app/features/calendar/presentation/widgets/w_calendar.dart';
import 'package:todo_app/features/calendar/presentation/widgets/w_tabbar.dart';
import 'package:todo_app/features/calendar/presentation/widgets/w_todo_item.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<String> _weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        switch (state.mainStatus) {
          case MainStatus.pure:
            context.read<CalendarBloc>().add(
                  GetTodosEvent(
                    dateTime: state.selectedDate,
                  ),
                );
            return const SizedBox();
          case MainStatus.loading:
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          case MainStatus.failure:
            return Center(
              child: Text(
                "Xatolik",
                style: context.styles.fontSz14Weight600ColorRed,
              ),
            );

          case MainStatus.success:
            return Scaffold(
              appBar: AppBar(
                  title: WTabbar(
                weekDay: _weekDays[state.selectedDate.weekday % 7],
                day: state.selectedDate.day.toString(),
                month: " ${_months[state.selectedDate.month - 1]} ",
                year: state.selectedDate.year.toString(),
              )),
              body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      WCalendar(
                        month: _months[state.selectedDate.month - 1],
                        weekDays: _weekDays,
                      ),
                      Gap(5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Schedule",
                            style: context.styles.fontSz14Weight600ColorDark1,
                          ),
                          WButton(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRouteNames.create_task_page);
                            },
                            text: "+ Add Event",
                            width: 100.w,
                            height: 30.h,
                            borderRadius: 10,
                            textStyle:
                                context.styles.fontSz10Weight600ColorWhite,
                          )
                        ],
                      ),
                      Gap(12.h),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            TodoModel todo = state.todaysTodos[index];
                            return WTodoItem(
                                todo: todo,
                                isLast: state.todaysTodos.length - 1 == index
                                    ? true
                                    : false);
                          },
                          separatorBuilder: (context, index) => Gap(14.h),
                          itemCount: state.todaysTodos.length,
                        ),
                      ),
                    ],
                  )),
            );
        }
      },
    );
  }

  // String reTime(DateTime date) {
  //   String a = "${date.hour}:${date.minute}";
  //   return a;
  // }
}

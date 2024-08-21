import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/core/widgets/w_button.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';

class WCalendar extends StatefulWidget {
  final String month;
  final List<String> weekDays;
  const WCalendar({
    super.key,
    required this.month,
    required this.weekDays,
  });

  @override
  State<WCalendar> createState() => _WCalendarState();
}

class _WCalendarState extends State<WCalendar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return SizedBox(
          height: 300.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.month,
                    style: context.styles.fontSz14Weight600ColorDark1,
                  ),
                  const Spacer(),
                  WButton(
                    onTap: () {
                      context.read<CalendarBloc>().add(
                            EditDateEvent(
                              date: DateTime(
                                state.selectedDate.year,
                                state.selectedDate.month - 1,
                              ),
                              failure: () {},
                              success: () {
                                context.read<CalendarBloc>().add(
                                      GetTodosEvent(
                                        dateTime: DateTime(
                                          state.selectedDate.year,
                                          state.selectedDate.month - 1,
                                        ),
                                      ),
                                    );
                              },
                            ),
                          );
                    },
                    color: context.colors.grey5,
                    child: SvgPicture.asset(
                      context.icons.left_icon,
                      width: 25,
                    ),
                  ),
                  Gap(10.w),
                  WButton(
                    onTap: () {
                      context.read<CalendarBloc>().add(
                            EditDateEvent(
                              date: DateTime(
                                state.selectedDate.year,
                                state.selectedDate.month + 1,
                              ),
                              failure: () {},
                              success: () {
                                context.read<CalendarBloc>().add(
                                      GetTodosEvent(
                                        dateTime: DateTime(
                                          state.selectedDate.year,
                                          state.selectedDate.month + 1,
                                        ),
                                      ),
                                    );
                              },
                            ),
                          );
                    },
                    color: context.colors.grey5,
                    child: SvgPicture.asset(
                      context.icons.right_icon,
                      width: 25,
                    ),
                  ),
                ],
              ),
              Gap(19.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.weekDays
                    .map((day) => Text(
                          day.substring(0, 3),
                          style: context.styles.fontSz12Weight400ColorGrey3,
                        ))
                    .toList(),
              ),
              Gap(20.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: _daysInMonth(state.selectedDate) +
                      _startingWeekday(state.selectedDate),
                  itemBuilder: (context, index) {
                    if (index < _startingWeekday(state.selectedDate)) {
                      return Container();
                    } else {
                      int day =
                          index - _startingWeekday(state.selectedDate) + 1;
                      Set<Prio> ls1 = {};
                      for (var element in state.todos) {
                        if (element.startDate.day == day &&
                            element.startDate.month ==
                                state.selectedDate.month &&
                            element.startDate.year == state.selectedDate.year) {
                          ls1.add(
                            element.priority,
                          );
                          // print("Element Name => ${element.name}");
                          // print("Element Date => ${element.startDate}");
                        }
                      }
                      List<Prio> ls = ls1.toList();
                      return GestureDetector(
                        onTap: () {
                          context.read<CalendarBloc>().add(
                                EditDateEvent(
                                  date: DateTime(
                                    state.selectedDate.year,
                                    state.selectedDate.month,
                                    day,
                                  ),
                                  failure: () {},
                                  success: () {},
                                ),
                              );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 25.w,
                              height: 25.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: state.selectedDate.day == day
                                    ? context.colors.blueMain
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                textAlign: TextAlign.center,
                                "$day",
                                style: state.selectedDate.day == day
                                    ? context.styles.fontSz12Weight400ColorDark1
                                        .copyWith(
                                        color: context.colors.white,
                                        fontWeight: FontWeight.w600,
                                      )
                                    : context
                                        .styles.fontSz12Weight400ColorDark1,
                              ),
                            ),
                            Gap(5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                ls.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child: Container(
                                    width: 4.w,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      color: ls[index] == Prio.low
                                          ? context.colors.blueMain
                                          : (ls[index] == Prio.medium
                                              ? context.colors.orange1
                                              : context.colors.red1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int _daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, 1);
    var firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  int _startingWeekday(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/routes_name/route_names.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';

class WTodoItem extends StatelessWidget {
  final TodoModel todo;
  final bool isLast;
  const WTodoItem({
    super.key,
    required this.todo,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CalendarBloc>().add(
              EditCurrentTodoEvent(
                todo: todo,
              ),
            );
        Navigator.of(context).pushNamed(
          AppRouteNames.info_page,
          arguments: todo,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 14.h : 0),
        width: double.maxFinite,
        height: 105.h,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: todo.priority == Prio.low
                  ? context.colors.blueMain
                  : (todo.priority == Prio.medium
                      ? context.colors.orange1
                      : context.colors.red1),
              width: 10,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          color: (todo.priority == Prio.low
                  ? context.colors.blueMain
                  : (todo.priority == Prio.medium
                      ? context.colors.orange1
                      : context.colors.red1))
              .withOpacity(
            0.2,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                todo.name,
                style: todo.priority == Prio.low
                    ? context.styles.fontSz14Weight600ColorBlue
                    : (todo.priority == Prio.medium
                        ? context.styles.fontSz14Weight600ColorOrange
                        : context.styles.fontSz14Weight600ColorRed),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                todo.description,
                style: todo.priority == Prio.low
                    ? context.styles.fontSz8Weight400ColorBlue
                    : (todo.priority == Prio.medium
                        ? context.styles.fontSz8Weight400ColorOrange
                        : context.styles.fontSz8Weight400ColorRed),
              ),
            ),
            Gap(10.h),
            Row(
              children: [
                SvgPicture.asset(
                  context.icons.clock,
                  color: todo.priority == Prio.low
                      ? context.colors.blue2
                      : (todo.priority == Prio.medium
                          ? context.colors.orange2
                          : context.colors.red2),
                ),
                Text(
                  "${reTime(todo.startDate)} - ${reTime(todo.endDate)}",
                  style: todo.priority == Prio.low
                      ? context.styles.fontSz10Weight400ColorBlue
                      : (todo.priority == Prio.medium
                          ? context.styles.fontSz10Weight400ColorOrange
                          : context.styles.fontSz10Weight400ColorRed),
                ),
                Gap(10.w),
                todo.eventLocation != ""
                    ? SvgPicture.asset(
                        context.icons.location,
                        color: todo.priority == Prio.low
                            ? context.colors.blue2
                            : (todo.priority == Prio.medium
                                ? context.colors.orange2
                                : context.colors.red2),
                      )
                    : const SizedBox(),
                Gap(4.w),
                todo.eventLocation != ""
                    ? Text(
                        todo.eventLocation,
                        style: todo.priority == Prio.low
                            ? context.styles.fontSz10Weight400ColorBlue
                            : (todo.priority == Prio.medium
                                ? context.styles.fontSz10Weight400ColorOrange
                                : context.styles.fontSz10Weight400ColorRed),
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }

  String reTime(DateTime date) {
    String a = "${date.hour}:${date.minute}";
    return a;
  }
}

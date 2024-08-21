import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/routes_name/route_names.dart';
import 'package:todo_app/core/widgets/w_button.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';

class WModal extends StatelessWidget {
  const WModal({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Reminder",
              style: context.styles.fontSz24Weight600ColorDark1,
            ),
            Gap(5.h),
            Text(
              textAlign: TextAlign.center,
              "Are you really you want deleting this todo?",
              style: context.styles.fontSz16Weight400ColorGrey1,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WButton(
                  width: 80.w,
                  height: 40.h,
                  textStyle: context.styles.fontSz16Weight400ColorWhite,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  text: "No",
                  color: context.colors.red1,
                  borderRadius: 12,
                ),
                WButton(
                  width: 80.w,
                  height: 40.h,
                  textStyle: context.styles.fontSz16Weight400ColorWhite,
                  onTap: () {
                    context.read<CalendarBloc>().add(
                          DeleteTodoEvent(
                            success: () {
                              context.read<CalendarBloc>().add(
                                    EditStatusEvent(),
                                  );
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRouteNames.home,
                                (route) => false,
                              );
                            },
                            failure: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: context.colors.dark1,
                                  content: Text(
                                    "Todo not deleted!",
                                    style: context
                                        .styles.fontSz14Weight400ColorWhite,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                    Navigator.of(context).pop();
                  },
                  text: "Yes",
                  color: context.colors.blueMain,
                  borderRadius: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

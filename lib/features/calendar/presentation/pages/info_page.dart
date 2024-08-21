import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/routes_name/route_names.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/core/widgets/w_button.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:todo_app/features/calendar/presentation/widgets/w_modal.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    super.key,
  });

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 54.h, left: 28.w, right: 28.w),
                width: double.maxFinite,
                height: 248.h,
                decoration: BoxDecoration(
                  color: state.todo!.priority == Prio.low
                      ? context.colors.blueMain
                      : (state.todo!.priority == Prio.medium
                          ? context.colors.orange1
                          : context.colors.red1),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(
                      20,
                    ),
                    bottomLeft: Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.colors.white,
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            child: SvgPicture.asset(
                              context.icons.left_icon,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRouteNames.create_task_page,
                              arguments: state.todo,
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                context.icons.edit,
                              ),
                              Gap(4.w),
                              Text(
                                "Edit",
                                style:
                                    context.styles.fontSz14Weight400ColorWhite,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Gap(20.h),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        state.todo!.name,
                        style: context.styles.fontSz26Weight600ColorWhite,
                      ),
                    ),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        state.todo!.description,
                        style: context.styles.fontSz8Weight400ColorWhite,
                      ),
                    ),
                    Gap(12.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          context.icons.clock,
                        ),
                        Gap(4.w),
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            "${reTime(
                              state.todo!.startDate,
                            )} - ${reTime(
                              state.todo!.endDate,
                            )}",
                            style: context.styles.fontSz10Weight400ColorWhite,
                          ),
                        )
                      ],
                    ),
                    Gap(12.h),
                    state.todo!.eventLocation != ""
                        ? Row(
                            children: [
                              SvgPicture.asset(
                                context.icons.location,
                              ),
                              Gap(4.w),
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  state.todo!.eventLocation,
                                  style: context
                                      .styles.fontSz10Weight400ColorWhite,
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Reminder",
                      style: context.styles.fontSz16Wight600ColorBlack,
                    ),
                    Gap(10.h),
                    Text(
                      "15 minutes befor",
                      style: context.styles.fontSz16Weight400ColorGrey1,
                    ),
                    Gap(22.h),
                    Text(
                      "Description",
                      style: context.styles.fontSz16Wight600ColorBlack,
                    ),
                    Gap(10.h),
                    Text(
                      state.todo!.description,
                      style: context.styles.fontSz10Weight400ColorGrey2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: WButton(
              height: 54.h,
              borderRadius: 10,
              color: context.colors.red3,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const WModal();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    context.icons.delete,
                  ),
                  Gap(2.w),
                  Text(
                    "Delete Event",
                    style: context.styles.fontSz14Weight600ColorDark1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String reTime(DateTime date) {
    String a = "${date.hour}:${date.minute}";
    return a;
  }
}

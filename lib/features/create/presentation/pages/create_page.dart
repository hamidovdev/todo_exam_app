import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/widgets/w_button.dart';
import 'package:todo_app/core/widgets/w_textfield.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:todo_app/features/create/presentation/bloc/create_bloc.dart';
import 'package:todo_app/features/create/presentation/widgets/w_expansion_widget.dart';
import 'package:todo_app/features/create/presentation/widgets/w_time.dart';

class CreateScreen extends StatefulWidget {
  final TodoModel? todo;
  const CreateScreen({
    super.key,
    this.todo,
  });

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late TextEditingController eventNameController;
  late TextEditingController eventDescriptionController;
  late TextEditingController eventLocationController;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  void initState() {
    if (widget.todo != null) {
      context.read<CreateBloc>().add(
            EditPriorityEvent(
              prio: widget.todo!.priority,
            ),
          );
    }
    eventDescriptionController = TextEditingController(
        text: widget.todo != null ? widget.todo!.description : "");
    eventLocationController = TextEditingController(
        text: widget.todo != null ? widget.todo!.eventLocation : "");
    eventNameController = TextEditingController(
        text: widget.todo != null ? widget.todo!.name : "");
    endDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day + 1,
      startDate.hour + 1,
      startDate.minute,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBloc, CreateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  context.icons.arrow_left,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: SingleChildScrollView(
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Name",
                      style: context.styles.fontSz14Weight400ColorDark2,
                    ),
                    Gap(4.h),
                    WTextField(
                      textInputAction: TextInputAction.next,
                      controller: eventNameController,
                      borderRadius: 8,
                      keyBoardType: TextInputType.text,
                      textStyle: context.styles.fontSz14Weight600ColorDark1,
                      hasBorderColor: false,
                    ),
                    Gap(16.h),
                    Text(
                      "Event description",
                      style: context.styles.fontSz14Weight400ColorDark2,
                    ),
                    Gap(4.h),
                    WTextField(
                      controller: eventDescriptionController,
                      textInputAction: TextInputAction.next,
                      minLines: 4,
                      maxlines: 7,
                      borderRadius: 8,
                      keyBoardType: TextInputType.text,
                      textStyle: context.styles.fontSz14Weight600ColorDark1,
                      hasBorderColor: false,
                    ),
                    Gap(16.h),
                    Text(
                      "Event location",
                      style: context.styles.fontSz14Weight400ColorDark2,
                    ),
                    Gap(4.h),
                    WTextField(
                      textInputAction: TextInputAction.done,
                      controller: eventLocationController,
                      borderRadius: 8,
                      keyBoardType: TextInputType.text,
                      textStyle: context.styles.fontSz14Weight600ColorDark1,
                      hasBorderColor: false,
                    ),
                    Gap(105.h),
                    Text(
                      "Event time",
                      style: context.styles.fontSz14Weight400ColorDark2,
                    ),
                    Gap(4.h),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: context.colors.grey4,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: WDateTimer(
                              hintText: "Start Time",
                              success: (value) {
                                startDate = value;
                              },
                              time: widget.todo?.startDate,
                            ),
                          ),
                          Expanded(
                            child: WDateTimer(
                              hintText: "End Time",
                              success: (value) {
                                endDate = value;
                              },
                              time: widget.todo?.endDate,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
                Positioned(
                  top: 350.h,
                  child: Column(
                    children: [
                      Text(
                        "Priority color",
                        style: context.styles.fontSz14Weight400ColorDark2,
                      ),
                      Gap(6.h),
                      const ExpansionWidget(),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: context.colors.white,
            child: WButton(
              borderRadius: 8,
              onTap: () {
                if (eventNameController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: context.colors.dark1,
                      content: Text(
                        "Please to enter todo name!",
                        style: context.styles.fontSz14Weight400ColorWhite,
                      ),
                    ),
                  );
                } else if (eventDescriptionController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: context.colors.dark1,
                      content: Text(
                        "Please to enter todo description!",
                        style: context.styles.fontSz14Weight400ColorWhite,
                      ),
                    ),
                  );
                } else {
                  if (widget.todo != null) {
                    context.read<CreateBloc>().add(
                          EditTodoEvent(
                            todo: TodoModel(
                              id: widget.todo!.id,
                              name: eventNameController.text,
                              description: eventDescriptionController.text,
                              eventLocation: eventLocationController.text,
                              priority: state.priority,
                              startDate: startDate,
                              endDate: endDate,
                              createdDate: DateTime.now(),
                            ),
                            success: () {
                              context.read<CalendarBloc>().add(
                                    EditCurrentTodoEvent(
                                      todo: TodoModel(
                                        id: widget.todo!.id,
                                        name: eventNameController.text,
                                        description:
                                            eventDescriptionController.text,
                                        eventLocation:
                                            eventLocationController.text,
                                        priority: state.priority,
                                        startDate: startDate,
                                        endDate: endDate,
                                        createdDate: DateTime.now(),
                                      ),
                                    ),
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: context.colors.green,
                                  content: Text(
                                    "Todo has changed!",
                                    style: context
                                        .styles.fontSz14Weight400ColorWhite,
                                  ),
                                ),
                              );
                              context.read<CalendarBloc>().add(
                                    EditStatusEvent(),
                                  );
                            },
                            failure: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: context.colors.dark1,
                                  content: Text(
                                    "Todo has not changed!",
                                    style: context
                                        .styles.fontSz14Weight400ColorWhite,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                  } else {
                    context.read<CreateBloc>().add(
                          CreateTodoEvent(
                            todo: TodoModel(
                              name: eventNameController.text,
                              description: eventDescriptionController.text,
                              eventLocation: eventLocationController.text,
                              priority: state.priority,
                              startDate: startDate,
                              endDate: endDate,
                              createdDate: DateTime.now(),
                            ),
                            success: () {
                              eventNameController.text = "";

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: context.colors.green,
                                  content: Text(
                                    "Todo added!",
                                    style: context
                                        .styles.fontSz14Weight400ColorWhite,
                                  ),
                                ),
                              );
                              context.read<CalendarBloc>().add(
                                    EditStatusEvent(),
                                  );
                            },
                            failure: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: context.colors.dark1,
                                  content: Text(
                                    "Todo not added!",
                                    style: context
                                        .styles.fontSz14Weight400ColorWhite,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                  }
                }
              },
              text: widget.todo != null ? "Edit" : "Add",
            ),
          ),
        );
      },
    );
  }
}

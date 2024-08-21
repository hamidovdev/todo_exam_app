import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/core/widgets/w_expansiontile.dart';
import 'package:todo_app/features/create/presentation/bloc/create_bloc.dart';

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget({super.key});

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBloc, CreateState>(
      builder: (context, state) {
        return SizedBox(
          width: 75.w,
          child: WExpansionTile(
            childrenPadding: 5.w,
            borderRadius: 8,
            icon: SvgPicture.asset(context.icons.down),
            title: Container(
              width: 34.w,
              height: 30.h,
              color: state.priority == Prio.low
                  ? context.colors.blueMain
                  : (state.priority == Prio.medium
                      ? context.colors.orange1
                      : context.colors.red1),
            ),
            children: [
              GestureDetector(
                onTap: () {
                  context.read<CreateBloc>().add(
                        EditPriorityEvent(
                          prio: Prio.low,
                        ),
                      );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  width: 30,
                  height: 42,
                  color: context.colors.blueMain,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<CreateBloc>().add(
                        EditPriorityEvent(
                          prio: Prio.medium,
                        ),
                      );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  width: 30,
                  height: 42,
                  color: context.colors.orange1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<CreateBloc>().add(
                        EditPriorityEvent(
                          prio: Prio.high,
                        ),
                      );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  width: 30,
                  height: 42,
                  color: context.colors.red1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

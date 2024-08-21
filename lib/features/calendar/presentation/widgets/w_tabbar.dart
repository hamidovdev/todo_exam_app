import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/extensions/extension.dart';

class WTabbar extends StatelessWidget {
  final String weekDay;
  final String day;
  final String month;
  final String year;
  const WTabbar({
    super.key,
    required this.weekDay,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: [
              Text(
                weekDay,
                style: context.styles.fontSz14Weight600ColorDark1,
              ),
              Row(
                children: [
                  Text(
                    day,
                    style: context.styles.fontSz10Weight400ColorDark1,
                  ),
                  Text(
                    month,
                    style: context.styles.fontSz10Weight400ColorDark1,
                  ),
                  Text(
                    year,
                    style: context.styles.fontSz10Weight400ColorDark1,
                  )
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              context.icons.notification,
            ),
          )
        ],
      ),
    );
  }
}

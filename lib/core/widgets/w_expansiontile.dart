// ignore_for_file: public_member_api_docs, sort_constructors_first, no_logic_in_create_state, unused_element
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/features/create/presentation/bloc/create_bloc.dart';

class WExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget? icon;
  final Color? borderColor;
  final double? borderRadius;
  final double? childrenPadding;
  final Color? collapsedBackgroundColor;
  final List<Widget>? children;

  const WExpansionTile({
    super.key,
    required this.title,
    this.icon,
    this.borderColor,
    this.borderRadius,
    this.childrenPadding,
    this.collapsedBackgroundColor,
    this.children,
  });

  @override
  _WTextFieldState createState() {
    return _WTextFieldState();
  }
}

class _WTextFieldState extends State<WExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBloc, CreateState>(
      builder: (context, state) {
        return ExpansionTile(
          key: Key(state.isOpen.toString()),
          onExpansionChanged: (value) {
            context.read<CreateBloc>().add(
                  EditOpenExpTileEvent(
                    isOpen: value,
                  ),
                );
          },
          initiallyExpanded: state.isOpen,
          tilePadding: const EdgeInsets.all(4),
          trailing: widget.icon,
          title: widget.title,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: widget.borderColor ?? context.colors.transparent,
            ),
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 8,
            ),
          ),
          childrenPadding: EdgeInsets.all(widget.childrenPadding ?? 20),
          collapsedBackgroundColor:
              widget.collapsedBackgroundColor ?? context.colors.grey4,
          visualDensity: VisualDensity.compact,
          children: widget.children ?? [],
        );
      },
    );
  }
}

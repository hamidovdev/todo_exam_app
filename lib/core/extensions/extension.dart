import 'package:flutter/material.dart';
import 'package:todo_app/asset/colors.dart';
import 'package:todo_app/asset/fonts.dart';
import 'package:todo_app/asset/icons.dart';
import 'package:todo_app/asset/theme.dart';

extension BuildContextGeneral on BuildContext {
  AppColors get colors {
    return AppColors();
  }

  AppTheme get theme {
    return AppTheme();
  }

  AppStyles get styles {
    return theme.lightTheme().extension<AppStyles>()!;
  }

  AppIcons get icons {
    return AppIcons();
  }
}

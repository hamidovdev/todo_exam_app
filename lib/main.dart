import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/extension.dart';
import 'package:todo_app/core/injector/injector.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:todo_app/features/create/presentation/bloc/create_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInjectore();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateBloc(),
        ),
        BlocProvider(
          create: (context) => CalendarBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          onGenerateRoute: AppRoute.onGenerateRoute,
          theme: context.theme.lightTheme(),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          themeAnimationDuration: const Duration(milliseconds: 250),
          themeAnimationCurve: Curves.slowMiddle,
        ),
      ),
    );
  }
}

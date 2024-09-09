import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_info_app/app.dart';

import 'theme/bloc/app_theme_bloc.dart';

void main(List<String> args) {
  runApp(BlocProvider(
    create: (context) => AppThemeBloc(),
    //using bloc
    child: const MyApp(),
  ));
}

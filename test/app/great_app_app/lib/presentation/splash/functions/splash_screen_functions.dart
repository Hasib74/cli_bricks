import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:great_app/core/routes/app_routes.dart';
import 'package:great_app/presentation/home/bloc/home_cubit.dart';

import '../../../main.dart';

class SplashScreenFunctions {
  init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));


    await BlocProvider.of<HomeCubit>(context).getProductData();

    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.HOME_SCREEN, (route) => false);
  }
}

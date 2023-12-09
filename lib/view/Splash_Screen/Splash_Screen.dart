// introduction_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovie/core/constants/color.dart';
import 'package:mymovie/cubit/SplashScreen/splash_screen_cubit.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashScreenCubit>(
      create: (context) => SplashScreenCubit(),
      child: IntroductionPageWidget(),
    );
  }
}

class IntroductionPageWidget extends StatefulWidget {
  const IntroductionPageWidget({Key? key}) : super(key: key);

  @override
  _IntroductionPageWidgetState createState() => _IntroductionPageWidgetState();
}

class _IntroductionPageWidgetState extends State<IntroductionPageWidget> {
  late SplashScreenCubit splashScreenCubit;

  @override
  void initState() {
    super.initState();
    splashScreenCubit = SplashScreenCubit();
    splashScreenCubit.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.IntroductionPage_BackgroundColor,
      body: Center(
        child: Builder(
          builder: (context) => Image.asset(
            'assets/splash_screen/Splash_screen.png',
            width: 300,
            height: 250,
          ),
        ),
      ),
    );
  }
}

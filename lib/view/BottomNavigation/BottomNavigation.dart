import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovie/core/constants/color.dart';
import 'package:mymovie/core/constants/app_icons.dart';
import 'package:mymovie/cubit/BottomNavigationBar/bottom_navigation_bar_cubit.dart';
import 'package:mymovie/view/Home/Home.dart';
import 'package:mymovie/view/Saved/Saqlanganlar.dart';
import 'package:mymovie/view/Setting/Setting.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                Home(),
                Saqlanganlar(),
                Setting(),
              ],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: (index) {
                  context.read<BottomNavigationBarCubit>().changeIndex(index);
                },
                backgroundColor: AppColors.BottomNavigationBar_backgroundColor,
                type: BottomNavigationBarType.fixed,
                unselectedIconTheme: IconThemeData(color: AppColors.Icon_Text),
                unselectedItemColor: AppColors.Icon_Text,
                selectedIconTheme:
                    IconThemeData(color: AppColors.IconTheme_ItemColor),
                selectedItemColor: AppColors.IconTheme_ItemColor,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.Boshmenu),
                    label: 'Bosh menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.Saqlanganlar),
                    label: 'Saqlanganlar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.Sozlanmlar),
                    label: 'Sozlanmalar',
                  ),
                ],
              ),
            ),
            backgroundColor:
                AppColors.BottomNavigationBarWidget_backgroundColor);
      },
    );
  }
}

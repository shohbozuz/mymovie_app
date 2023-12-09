part of 'bottom_navigation_bar_cubit.dart';

@immutable
abstract class BottomNavigationBarState {
  final int currentIndex;
  BottomNavigationBarState(this.currentIndex);
}

class BottomNavigationBarInitial extends BottomNavigationBarState {
  BottomNavigationBarInitial(super.currentIndex);
}



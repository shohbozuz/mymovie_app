
// home_state.dart
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Category> categoryList;

  HomeSuccess({required this.categoryList});
}

class HomeError extends HomeState {}

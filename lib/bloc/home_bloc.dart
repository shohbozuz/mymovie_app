// home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mymovie/models/category.dart';

import '../service/remote/category_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryService categoryService = CategoryService();

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
      HomeEvent event,
      ) async* {
    if (event is FetchCategories) {
      yield HomeLoading();
      try {
        final List<Category> categoryList = await categoryService.getData();
        yield HomeSuccess(categoryList: categoryList);
      } catch (e) {
        yield HomeError();
      }
    }
  }
}
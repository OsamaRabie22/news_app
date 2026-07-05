import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/home/home_state.dart';
import 'package:news/models/category.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(ShowCategories());

  void selectCategory(Category category) {
    emit(ShowCategoryDetails(category));
  }

  void goBack(){
    emit(ShowCategories());
}

}
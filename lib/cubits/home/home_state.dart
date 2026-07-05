import 'package:news/models/category.dart';

abstract class HomeState {}

class ShowCategories extends HomeState {}
class ShowCategoryDetails  extends HomeState{
  final Category category;
  ShowCategoryDetails(this.category);
}
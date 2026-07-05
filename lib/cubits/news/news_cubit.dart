import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/cubits/news/news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit(): super(NewsLoading());

  void getNews(String sourceId)async{
    emit(NewsLoading());
    try{
      var response=await ApiManager.getNewsById(sourceId);
      emit(NewsSuccess(response.articles??[]));
    }catch(e){
      emit(NewsError(e.toString()));
    }
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/cubits/sources/sources_state.dart';
import 'package:news/models/source_response.dart';

class SourcesCubit extends Cubit<SourcesState>{
  SourcesCubit(): super(SourcesLoading());
  List<Sources> sources=[];
  int selectedIndex=0;
  void getSources(String category)async{
    emit(SourcesLoading());
    try{
      var response=await ApiManager.getSources(category);
      sources=response.sources??[];
      emit(SourcesSuccess(sources));
    }catch(e){
      emit(SourcesError(e.toString()));
    }
  }
  void changeSource(int index) {
    selectedIndex = index;
    emit(SourcesSuccess(sources));
  }
}
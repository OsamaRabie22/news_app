import 'package:news/models/source_response.dart';

abstract class SourcesState {}

class SourcesLoading extends SourcesState {}

class SourcesError extends SourcesState {
  final String message;

  SourcesError(this.message);
}

class SourcesSuccess extends SourcesState {
  final List<Sources> sources;

  SourcesSuccess(this.sources);
}

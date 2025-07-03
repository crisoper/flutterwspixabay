// Eventos que puede recibir el BLoC: búsqueda de fotos

import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPhotosEvent extends PhotoEvent {
  final String query;

  SearchPhotosEvent(this.query);

  @override
  List<Object?> get props => [query];
}

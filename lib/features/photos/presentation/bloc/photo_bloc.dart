// BLoC que maneja la lógica de búsqueda de fotos

import 'package:fllutterwebservice/features/photos/domain/usecases/search_photos_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'photo_event.dart';
import 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final SearchPhotosUseCase searchPhotosUseCase;

  PhotoBloc(this.searchPhotosUseCase) : super(PhotoInitial()) {
    on<SearchPhotosEvent>((event, emit) async {
      emit(PhotoLoading());
      try {
        final photos = await searchPhotosUseCase.execute(event.query);
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError('Error al cargar fotos'));
      }
    });
  }
}

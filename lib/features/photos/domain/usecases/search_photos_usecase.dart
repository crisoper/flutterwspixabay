// Caso de uso que ejecuta la búsqueda de fotos mediante el repositorio

import 'package:fllutterwebservice/features/photos/domain/entities/photo.dart';
import 'package:fllutterwebservice/features/photos/domain/repository/photo_repository.dart';

class SearchPhotosUseCase {
  final PhotoRepository repository;

  SearchPhotosUseCase(this.repository);

  // Ejecuta la búsqueda y devuelve una lista de fotos
  Future<List<Photo>> execute(String query) async {
    return await repository.searchPhotos(query);
  }
}

// Implementación del repositorio que convierte PhotoModel a Photo

import 'package:fllutterwebservice/features/photos/domain/entities/photo.dart';
import 'package:fllutterwebservice/features/photos/domain/repository/photo_repository.dart';

import 'datasource/photo_api_datasource.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApiDataSource api;

  PhotoRepositoryImpl(this.api);

  @override
  Future<List<Photo>> searchPhotos(String query) async {
    final models = await api.searchPhotos(query);
    return models
        .map((model) => Photo(
              id: model.id,
              title: model.tags,
              thumbnailUrl: model.previewURL,
              imageUrl: model.largeImageURL,
              views: model.views,
              downloads: model.downloads,
            ))
        .toList();
  }
}

// Interfaz que define los métodos que debe cumplir cualquier repositorio de fotos

import 'package:fllutterwebservice/features/photos/domain/entities/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> searchPhotos(String query);
}

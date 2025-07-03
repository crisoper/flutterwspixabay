// Modelo que representa una foto recibida desde la API de Pixabay

class PhotoModel {
  final int id;
  final String tags;
  final String previewURL;
  final String webformatURL;
  final String largeImageURL;
  final int views;
  final int downloads;

  PhotoModel({
    required this.id,
    required this.tags,
    required this.previewURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.views,
    required this.downloads,
  });

  // Factory para construir una instancia desde un JSON
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      webformatURL: json['webformatURL'],
      largeImageURL: json['largeImageURL'],
      views: json['views'],
      downloads: json['downloads'],
    );
  }
}

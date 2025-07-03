// Entidad del dominio, una representación limpia y reutilizable de una foto

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;
  final String imageUrl;
  final int views;
  final int downloads;

  Photo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.views,
    required this.downloads,
  });
}

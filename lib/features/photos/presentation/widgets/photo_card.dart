import 'package:fllutterwebservice/features/photos/domain/entities/photo.dart';
import 'package:fllutterwebservice/shared/widgets/cached_photo.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: photo);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CachedPhoto(
                imageUrl: photo.thumbnailUrl,
                width: 130,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),

              Expanded(
                child: SizedBox(
                  height: 100, // Coincide con la altura de la imagen
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título alineado arriba
                      Text(
                        photo.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 12),

                      // Vistas y descargas
                      Row(
                        children: [
                          const Icon(Icons.visibility, size: 16),
                          const SizedBox(width: 4),
                          Text('${photo.views}'),
                          const SizedBox(width: 12),
                          const Icon(Icons.download, size: 16),
                          const SizedBox(width: 4),
                          Text('${photo.downloads}'),
                        ],
                      ),

                      // Flecha al fondo a la derecha
                      const Spacer(),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.arrow_forward_ios, size: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

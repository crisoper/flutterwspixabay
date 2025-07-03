import 'package:fllutterwebservice/features/photos/domain/entities/photo.dart';
import 'package:flutter/material.dart';

// precacheImage(...)	Comienza la descarga de la imagen antes de mostrar el widget
// FutureBuilder	Permite mostrar el loading inmediatamente
// Image.network	Se carga solo después de que la imagen está lista en caché

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context)!.settings.arguments as Photo;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          photo.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen con precache + loading instantáneo
            viewImage(photo, context),

            const SizedBox(height: 20),

            viewDownloadViews(photo),
            const SizedBox(height: 20),

            Text(
              photo.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<void> viewImage(Photo photo, BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(photo.imageUrl), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(13),
            clipBehavior:
                Clip.antiAlias, // Para que la imagen respete los bordes
            child: Image.network(
              photo.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        } else {
          return Container(
            height: 250,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                Text(
                  'Cargando imagen...',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Row viewDownloadViews(Photo photo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Icon(Icons.visibility),
            const SizedBox(height: 4),
            Text('Vistas: ${photo.views}'),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.download),
            const SizedBox(height: 4),
            Text('Descargas: ${photo.downloads}'),
          ],
        ),
      ],
    );
  }
}

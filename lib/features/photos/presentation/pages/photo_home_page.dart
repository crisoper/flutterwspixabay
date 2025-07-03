import 'package:fllutterwebservice/features/photos/presentation/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fllutterwebservice/features/photos/presentation/bloc/photo_bloc.dart';
import 'package:fllutterwebservice/features/photos/presentation/bloc/photo_event.dart';
import 'package:fllutterwebservice/features/photos/presentation/bloc/photo_state.dart';

class PhotoHomePage extends StatefulWidget {
  const PhotoHomePage({super.key});

  @override
  State<PhotoHomePage> createState() => _PhotoHomePageState();
}

class _PhotoHomePageState extends State<PhotoHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buscador fotos',
          style: TextStyle(
            fontSize: 18, // Aumentamos el tamaño de la fuente
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      prefixIcon: const Icon(Icons.search), // Ícono de lupa a la izquierda
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (query) {
                      final trimmedQuery = query.trim();
                      if (trimmedQuery.isNotEmpty) {
                        context.read<PhotoBloc>().add(SearchPhotosEvent(trimmedQuery));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // Resultado
          Expanded(
            child: BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, state) {
                if (state is PhotoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PhotoLoaded) {
                  if (state.photos.isEmpty) {
                    return const Center(child: Text('Sin resultados!'));
                  }
                  return ListView.builder(
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                      final photo = state.photos[index];
                      return PhotoCard(photo: photo);
                    },
                  );
                } else if (state is PhotoError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('Buscar...'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

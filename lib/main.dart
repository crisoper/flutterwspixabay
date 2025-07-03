import 'package:fllutterwebservice/features/photos/data/datasource/photo_api_datasource.dart';
import 'package:fllutterwebservice/features/photos/data/photo_repository_impl.dart';
import 'package:fllutterwebservice/features/photos/domain/usecases/search_photos_usecase.dart';
import 'package:fllutterwebservice/features/photos/presentation/bloc/photo_bloc.dart';
import 'package:fllutterwebservice/features/photos/presentation/pages/photo_detail_page.dart';
import 'package:fllutterwebservice/features/photos/presentation/pages/photo_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/themes/app_theme.dart';
// Importamos nuestro tema personalizado

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inyección manual de dependencias
    final photoApiDataSource = PhotoApiDataSource();
    final photoRepository = PhotoRepositoryImpl(photoApiDataSource);
    final searchPhotosUseCase = SearchPhotosUseCase(photoRepository);

    return BlocProvider(
      create: (_) => PhotoBloc(searchPhotosUseCase),
      child: MaterialApp(
        title: 'Pixabay App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const PhotoHomePage(),
          '/detail': (context) => const PhotoDetailPage(),
        },
      ),
    );
  }
}

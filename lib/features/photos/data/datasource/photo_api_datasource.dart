// Fuente de datos que se conecta a la API de Pixabay

import 'dart:convert';
import 'package:fllutterwebservice/features/photos/data/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoApiDataSource {
  final String _apiKey = '50259145-bf60859095b70472804f712d3';

  Future<List<PhotoModel>> searchPhotos(String query) async {
    final url = Uri.parse(
      'https://pixabay.com/api/?key=$_apiKey&q=$query&image_type=photo',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final hits = body['hits'] as List;
      return hits.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching photos');
    }
  }
}

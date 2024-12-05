
import 'package:dio/dio.dart';

class PictureService {
  final Dio _dio = Dio();

  // Fetch List Foto
  Future<List<dynamic>> fetchPictures({int page = 1, int limit = 10}) async {
    try {
      // Menambahkan parameter page dan limit ke URL
      final response =
          await _dio.get('https://picsum.photos/v2/list', queryParameters: {
        'page': page,
        'limit': limit,
      });
      return response.data;
    } catch (e) {
      throw Exception('Failed to load pictures: $e');
    }
  }

  // Fetch Detail Foto
  Future<Map<String, dynamic>> fetchPictureDetail(String id) async {
    try {
      final response = await _dio.get('https://picsum.photos/id/$id/info');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load picture detail: $e');
    }
  }
}

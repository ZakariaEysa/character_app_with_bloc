import 'package:flutter/cupertino.dart';

import '../../constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      List<dynamic> characters = [];
      String base = baseUrl;
      for (int i = 1; i <= 28; i++) {
        if (i == 27 || i == 7 || i == 10 || i == 18 || i == 21 || i == 22)
          continue;
        Response response = await dio.get(base + i.toString());
        characters.add(response.data);
      }
      return characters;
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getQuotes() async {
    final dio = Dio();

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'X-Api-Key': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        debugPrint('Response data: ${response.data}');

        return response.data;
      } else {
        debugPrint(
            'Failed to load quotes. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}

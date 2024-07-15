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
      // List<dynamic> characters =[];
      // String base=baseUrl;
      // for (int i = 1; i <= 28; i++) {
      //
      //   Response response = await dio.get(base+i.toString());
      //   characters.add(response.data);
      //
      // }
      // return characters;

      Response response = await dio.get(baseUrl);

      return response.data["results"];
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getQuotes() async {
    final dio = Dio();
    const apiKey = 'shJDm+FaPDC2Ggb//ynMEw==pSHtYW94h2LoUwev';
    const url = 'https://api.api-ninjas.com/v1/quotes?category=faith';

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
        debugPrint('Failed to load quotes. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}


import 'package:character_app_with_bloc/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices{
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
      Response response = await dio.get(baseUrl);


      return response.data["results"];
    } catch (e) {
      return [];
    }
  }


}
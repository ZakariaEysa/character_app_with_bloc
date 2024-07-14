
import '../../constants/strings.dart';
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


}
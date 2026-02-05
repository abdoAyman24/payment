
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> post({
    required String url,
    required Map<String,dynamic> body,
    required String token,
    String? contentType,
  }) async {
    var respons = await dio.post(
      url,
      data: body,
      options: Options(
        contentType:Headers.formUrlEncodedContentType,
        headers: {'Authorization': "Bearer $token"}),
    );

    return respons;
  }
}

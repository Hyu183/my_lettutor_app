import 'package:dio/dio.dart';

class DioClient {
  static final  Dio dio = Dio(BaseOptions(
        baseUrl: 'https://sandbox.api.lettutor.com',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json));

//   DioClient() {
    // var _options = BaseOptions(
    //     baseUrl: 'https://sandbox.api.lettutor.com',
    //     connectTimeout: 5000,
    //     receiveTimeout: 3000,
    //     contentType: Headers.jsonContentType,
    //     responseType: ResponseType.json);

//     _dio = Dio(_options);
//   }

//   Future<Response> get(String uri)  {
//     try {
//       return  _dio.get(uri);
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<Response> post(String uri,) async {
//     try {
//       return await _dio.get(uri);
//     } catch (e) {
//       throw e;
//     }
//   }
}

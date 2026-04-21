import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CoreDio {
  late final Dio dio;

  static final CoreDio instance = CoreDio._internal();

  factory CoreDio() {
    return instance;
  }

  CoreDio._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.openverse.org/",
        connectTimeout: Duration(seconds: 15),
        contentType: "text/json",
        responseType: ResponseType.json,
      ),
    );
    // dio.interceptors.add(PrettyDioLogger(responseBody: true));
  }

  Future<Response> getApi({
    required String apiUrl,
    Map<String, dynamic>? queryParam,
  }) async {
    try {
      final response = await dio.get(apiUrl, queryParameters: queryParam);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (e) {
      rethrow;
    }
  }
}

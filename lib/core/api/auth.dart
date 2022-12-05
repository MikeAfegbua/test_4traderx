import 'package:dio/dio.dart';
import '../../app/utils/custom_exception.dart';
import '../../app/utils/error_util.dart';
import '../../app/utils/local_storage.dart';
import 'package:global_configuration/global_configuration.dart';

class AuthApi {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: GlobalConfiguration().get('base_url'),
      sendTimeout: 50000,
      connectTimeout: 50000,
      receiveTimeout: 50000,
      contentType: 'application/json',
      validateStatus: (int? s) => s! < 500,
      headers: {
        'Authorization': 'Bearer ${AppCache.getToken()}',
      },
    ),
  );

  Future<String> loginApi(Map<String, dynamic> data) async {
    String url = '/login';
    try {
      Response res = await dio.post<dynamic>(url, data: data);

      switch (res.statusCode) {
        case 200:
          return res.data['token'];
        default:
          // ignore: avoid_print
          print(res.data);
          throw res.data['message'];
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}

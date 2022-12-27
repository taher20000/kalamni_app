

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  /// init////
  static init() {
    Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

//////////// get data /////////////


  static Future<Response> getData({
    required String url,
    String lang = 'en',
    String? token
  }) async
  {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      // ignore: unnecessary_null_in_if_null_operators
      'Authorization': token ?? '',
    };
    return await dio.get<dynamic>(
        url
    );
  }

//////////// post data /////////////
 static  Future<Response> postData({
   required String url,
     Map<String,dynamic>? query,
  required Map<String,dynamic> data,
  String lang ='en',
  String? token,

  })async{
dio.options.headers={
  'lang': lang,
  'Content-Type': 'application/json',
  // ignore: unnecessary_null_in_if_null_operators
  'Authorization': token ?? '',
  };
return await dio.post(
  url,
  queryParameters: query,
  data: data
  );
  }


//////////// put data /////////////

static Future<Response>putData({
  required String url,
  required Map<String,dynamic>data,
  Map<String,dynamic>?query,
  String lang ='en',
  String? token
})async
{
dio.options.headers={
  'lang': lang,
  'Content-Type': 'application/json',
  // ignore: unnecessary_null_in_if_null_operators
  'Authorization': token ?? '',
};
return await dio.put(
  url,
  data: data,
  queryParameters: query,

);
}
}

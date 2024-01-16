import 'package:currency_flutter/data/model/currency_model.dart';
import 'package:dio/dio.dart';

import 'api_service.dart';

// class ApiServiceImpl extends ApiService{
//   final _dio = Dio(
//     BaseOptions(
//       receiveDataWhenStatusError: true,
//       baseUrl: 'https://cbu.uz',
//       contentType: 'application/json',
//       connectTimeout: const Duration(seconds: 60),
//       receiveTimeout: const Duration(seconds: 60),
//      // headers: {'Bearer token':'srafsfasrfgrsagdrhrther654r5h4d'},
//     //    queryParameters: {'dfsd':'sdfds'}
//     )
//   );
//
//
// Future<List<CurrencyModel>> getCurrency() async {
//   try {
//     //dio.options.headers['gs'] = 'ssfdg';
//     final response = await _dio.get('/uz/arkhiv-kursov-valyut/json/',);
//     return (response.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
//   } on DioException catch(e){
//     return  [];
//   }
// }
//
// }


class ApiServiceImpl extends ApiService {

  static final _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://cbu.uz/',
      contentType: 'application/json'));

  @override
  Future<List<CurrencyModel>> getCurrency(String date) async {
    try {
      final response =
      await _dio.get('uz/arkhiv-kursov-valyut/json/all/$date/');

      return (response.data as List)
          .map((data) => CurrencyModel.fromJson(data))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
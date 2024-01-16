
import 'package:currency_flutter/data/model/currency_model.dart';
import 'package:currency_flutter/data/repository/currency_repository.dart';
import 'package:currency_flutter/data/souce/remote/api_service_impl.dart';

class CurrencyRepositoryImpl extends CurrencyRepository{
  final apiService = ApiServiceImpl();
  @override
  Future<List<CurrencyModel>> getCurrency(String date) async {
   final result = await apiService.getCurrency(date);
   return result;
  }

}
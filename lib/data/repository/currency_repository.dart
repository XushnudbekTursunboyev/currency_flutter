
import 'package:currency_flutter/data/model/currency_model.dart';

abstract class CurrencyRepository{
  Future<List<CurrencyModel>> getCurrency(String date);
}
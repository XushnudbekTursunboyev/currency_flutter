part of 'main_bloc.dart';

class MainState {
  final Status? status;
  final List<CurrencyModel>? data;
  final String? date;

  MainState({this.status, this.data, this.date});
  MainState copyWith({Status? status, List<CurrencyModel>? data, String? date}) => MainState(status: status ?? this.status, data: data ?? this.data, date: date ?? this.date);
}

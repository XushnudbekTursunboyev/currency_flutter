part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class InitialCurrencyEvent extends MainEvent{
  final String date;

  InitialCurrencyEvent(this.date);
}


import 'package:bloc/bloc.dart';
import 'package:currency_flutter/data/model/currency_model.dart';
import 'package:currency_flutter/data/repository/currency_repository_impl.dart';
import 'package:currency_flutter/utils/status.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<InitialCurrencyEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      final repository = CurrencyRepositoryImpl();
      try {
        final data = await repository.getCurrency(state.date ?? "09.01.2024");
        emit(state.copyWith(status: Status.SUCCESS, data: data ));
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });
  }
}

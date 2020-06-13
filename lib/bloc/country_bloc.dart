import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:italy_football_apps/bloc/blocs.dart';
import 'package:italy_football_apps/model/models.dart';
import 'package:italy_football_apps/services/services.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  @override
  CountryState get initialState => CountryInitial();

  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is FetchCountry) {
      List<Country> country =
          await CountryServices.getCountryLeague(event.country);

      yield CountryLoaded(country: country);
    }
  }
}

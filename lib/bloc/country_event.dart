part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();
}

class FetchCountry extends CountryEvent {
  final String country;

  FetchCountry({this.country});

  @override
  List<Object> get props => [];
}

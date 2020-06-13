part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class CountryInitial extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoaded extends CountryState {
  final List<Country> country;

  CountryLoaded({this.country});

  @override
  List<Object> get props => [country];
}

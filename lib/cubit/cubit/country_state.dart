part of 'country_cubit.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountriesLoadInProgress extends CountryState {}

class CountriesLoadSuccess extends CountryState {
  CountriesLoadSuccess(this.countries);

  final List<CountryModel> countries;

}

class CountriesLoadFailure extends CountryState {
  CountriesLoadFailure({required this.error});
  String error;
}


// ----------------------------------------

class CountryLoadInProgress extends CountryState {}

class CountryLoadSuccess extends CountryState {
  CountryLoadSuccess(this.country);

  final CountryModel country;

}

class CountryLoadFailure extends CountryState {
  CountryLoadFailure({required this.error});
  String error;
}

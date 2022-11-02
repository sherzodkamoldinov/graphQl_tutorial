import 'package:bloc/bloc.dart';
import 'package:graphql_tutorial/api/api_service.dart';
import 'package:graphql_tutorial/api/models/country_model.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit({required ApiService apiService})
      : _jobsApiClient = apiService,
        super(CountryInitial());


  final ApiService _jobsApiClient;

  Future<void> getQueryCountry({
    required String code,
  }
  ) async {
    emit(CountryLoadInProgress());
    try {
      final country = await _jobsApiClient.getQueryCountry(code: code);
      emit(CountryLoadSuccess(country));
    } catch (error) {
      emit(CountryLoadFailure(
        error: error.toString()
      ));
    }
  }

  Future<void> getQueryCountries(
  ) async {
    emit(CountriesLoadInProgress());
    try {
      final countries = await _jobsApiClient.getQueryCountries();
      emit(CountriesLoadSuccess(countries));
    } catch (error) {
      emit(CountriesLoadFailure(
        error: error.toString()
      ));
    }
  }
}
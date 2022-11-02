import 'package:graphql/client.dart';
import 'package:graphql_tutorial/api/models/country_model.dart';
import 'package:graphql_tutorial/api/queries/get_country.dart';

class ApiService {
  const ApiService({
    required GraphQLClient graphQLClient,
  }) : _graphQLClient = graphQLClient;

  final GraphQLClient _graphQLClient;

  factory ApiService.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return ApiService(
        graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link));
  }

  Future<List<CountryModel>> getQueryCountries() async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(getCountries),
      ),
    );
    if (result.hasException) throw Exception();
    final data = result.data?['countries'] as List;
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<CountryModel> getQueryCountry({required String code}) async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(getCountry),
        variables:{"code": code},
      ),
    );
    if (result.hasException) throw Exception();
    final data = result.data?['country'] as Map<String, dynamic>;
    return CountryModel.fromJson(data);

  }
}

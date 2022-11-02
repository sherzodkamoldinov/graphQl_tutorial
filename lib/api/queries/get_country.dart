const getCountry = r'''
query getSingleCountry($code:ID!) {
  country(code: $code) {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
}
''';

const getCountries = '''
query {
  countries {
    code
    name
    emoji
  }
}
''';

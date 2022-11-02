import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_tutorial/api/models/country_model.dart';
import 'package:graphql_tutorial/cubit/cubit/country_cubit.dart';
import 'package:graphql_tutorial/ui/home_page.dart';

class SingleCountryView extends StatefulWidget {
  const SingleCountryView({super.key, required this.code});

  final String code;

  @override
  State<SingleCountryView> createState() => _SingleCountryViewState();
}

class _SingleCountryViewState extends State<SingleCountryView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountryCubit>(context).getQueryCountry(code: widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<CountryCubit>(context).getQueryCountries();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          },
        ),
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          if (state is CountryLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CountryLoadFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CountryLoadSuccess) {
            CountryModel country = state.country;
            return Column(
              children: [
                Text(
                  country.emoji,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  'Country name: ${country.name}',
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

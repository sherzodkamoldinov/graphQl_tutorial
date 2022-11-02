import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_tutorial/cubit/cubit/country_cubit.dart';
import 'package:graphql_tutorial/ui/single_country_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
        centerTitle: true,
      ),
      body: BlocBuilder<CountryCubit, CountryState>(

        builder: (context, state) {
          if (state is CountriesLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CountriesLoadSuccess) {
            return ListView.builder(itemBuilder: (context, index) {
              var country = state.countries[index];
              return ListTile(
                leading: Text(
                  country.emoji,
                  style: const TextStyle(fontSize: 24),
                ),
                title: Text(country.name),
                subtitle: Text(country.code),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SingleCountryView(code: country.code)));
                },
              );
            });
          } else if (state is CountryLoadFailure) {
            return SizedBox(
              child: Text(state.error),
            );
          } else {
            return const Text('Nothing');
          }
        },
      ),
    );
  }
}

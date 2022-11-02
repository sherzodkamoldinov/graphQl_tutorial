import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_tutorial/api/api_service.dart';
import 'package:graphql_tutorial/cubit/cubit/country_cubit.dart';
import 'package:graphql_tutorial/ui/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CountryCubit(
        apiService: ApiService.create(),
      )..getQueryCountries(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

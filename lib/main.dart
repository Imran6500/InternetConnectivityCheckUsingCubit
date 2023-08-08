import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_check_using_cubit/cubit/internet_cubit.dart';
import 'package:internet_connectivity_check_using_cubit/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}

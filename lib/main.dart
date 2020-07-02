import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercurrencyconverter/bloc/currency_base/currency_base_bloc.dart';
import 'package:fluttercurrencyconverter/bloc/currency_converter/currency_converter_bloc.dart';
import 'package:fluttercurrencyconverter/bloc/currency_rate/cc_bloc.dart';
import 'package:fluttercurrencyconverter/bloc/cc_delegate.dart';
import 'services/cc_repository.dart';
import 'views/cc_home_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleDelegate();
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => myAppState();
}

class myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencyRateBloc>(
          create: (_) => CurrencyRateBloc(Repository()),
        ),
        BlocProvider<CurrencyConverterBloc>(
          create: (_) => CurrencyConverterBloc(Repository()),
        ),
        BlocProvider<CurrencyBaseBloc>(
          create: (_) => CurrencyBaseBloc(Repository()),
        ),
      ],
      child: MaterialApp(
        title: "Currency Converter",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: CurrencyHomeScreen(),
        // home: Scaffold(
        //   body: SplashScreen(
        //     splashAnimationDuration: 3,
        //     navigateAfterSeconds: HomeScreen(),
        //   ),
        // ),
      ),
    );
  }
}

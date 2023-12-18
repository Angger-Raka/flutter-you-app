import 'package:flutter/material.dart';
import 'package:you_app/bloc/login.dart';
import 'screens/Login.dart';
import 'routes/RouteGenerator.dart';
import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  developer.log('log me' );
  runApp(const App());
}


class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginBloc(),
    child:Routing() );
  }
}

class Routing extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginBloc, LoginState>( builder:(context, state){
      print('main app');
      print(state);
      return MaterialApp(
          title: 'Named Routes Demo',
          initialRoute: '/',
          routes:  Map.fromIterable(
            routes,
            key: (route) => route.route,
            value: (route) => route.builder,
          )
      );
    }) ;
  }
}





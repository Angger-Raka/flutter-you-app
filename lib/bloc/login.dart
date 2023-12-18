import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;


abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

// lib/bloc/login_state.dart

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String username;
  final String email;
  final int id;

  LoginSuccessState({
    required this.username,
    required this.email,
    required this.id,
  });
}

class LoginFailureState extends LoginState {
  final String error;

  const LoginFailureState({required this.error});

  @override
  List<Object?> get props => [error];
}


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();

      try {
        // Add your login logic here
        // For simplicity, we will use a delay to simulate a network request
        await Future.delayed(Duration(seconds: 2));
        Future<http.Response> response =  http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
        // Use await to wait for the result
        http.Response result = await response;

        if (result.statusCode == 200) {
          // Use yield to emit the LoginSuccessState
          yield LoginSuccessState(username: '', email: '', id: 1);
          print('Response data: ${json.decode(result.body)}');
        } else {
          print('Request failed with status: ${result.statusCode}. ${result.reasonPhrase}');
        }
        // Assuming login is successful
      } catch (error) {
        yield LoginFailureState(error: 'Login failed. Please try again.');
      }
    }
  }
}
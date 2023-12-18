import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/appbar_customer.dart';
import '../bloc/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginBloc(),
    child:Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: [
              Color(0xFF1F4247),
              Color(0xFF0D1D23).withOpacity(1),
              Color(0xFF09141A),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 32.0),
            CustomAppBar(),
            LoginForm(),
          ],
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _usernameNotEmpty = false;
  bool _passwordNotEmpty = false;

  Widget buildUsernameTextField(){
    return TextFormField(
      controller: _usernameController,
      onChanged: (value) {
        setState(() {
          _usernameNotEmpty = value.isNotEmpty ? true : false;
        });
      },
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.40),
          fontFamily: 'Inter',
          fontSize: 13.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget buildPasswordTextField(){
    return TextFormField(
      controller: _passwordController,
      onChanged: (value) {
        setState(() {
          _passwordNotEmpty = value.isNotEmpty ? true : false;
        });
      },
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.40),
          fontFamily: 'Inter',
          fontSize: 13.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Color.fromRGBO(213, 190, 136, 1),
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
      style: TextStyle(color: Colors.white),
      obscureText: _obscurePassword,
    );
  }

  Widget buildButtonLogin(LoginBloc loginBloc){
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          loginBloc.add(LoginButtonPressed(
            username: 'your_username', // replace with actual username input
            password: 'your_password', // replace with actual password input
          ));
          String username = _usernameController.text;
          String password = _passwordController.text;
          print('Username: $username, Password: $password');
        },
        child: Container(
          height: 50.0, // Adjust the height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: _usernameNotEmpty && _passwordNotEmpty ?  [
                Color(0xFF62CDCB),
                Color(0xFF4599DB),
              ] :  [
                Color(0xFF62CDCB).withOpacity(0.2),
                Color(0xFF4599DB).withOpacity(0.2),
              ],
              stops: [0.2488, 0.7849],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF62CDCB).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Color(0xFF4599DB).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                color:_usernameNotEmpty && _passwordNotEmpty ? Colors.white : Colors.white.withOpacity(0.2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLinkRedirectRegister(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an Account? ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Register here',
            style: TextStyle(
              color: Color.fromRGBO(213, 190, 136, 1),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder<LoginBloc, LoginState>( builder:(context, state){
      print(state);
      String username = '';
      if( state is LoginSuccessState){
        username = state.username;
      }
      return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '$username',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 24.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          buildUsernameTextField(),
          SizedBox(height: 16.0),
          buildPasswordTextField(),
          SizedBox(height: 20.0),
          buildButtonLogin(loginBloc),
          SizedBox(height: 30.0),
          buildLinkRedirectRegister(),
        ],
      ),
    );

    });
  }
}

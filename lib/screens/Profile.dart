import 'package:flutter/material.dart';
class Profile extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
              body: Center(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'hello im so fine',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: ()=>{},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            );
    }
}
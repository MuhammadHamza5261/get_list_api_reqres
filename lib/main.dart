import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_list_api/bloc/get_list_bloc.dart';
import 'package:get_list_api/screens/show_list_Screen.dart';

 void main(){
    runApp(
      MultiBlocProvider(
          providers:[
             BlocProvider<GetListBloc>(create: (context) => GetListBloc(),),
          ],
          child: const MyApp(),
      ),
    );

 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowListScreen(),
    );
  }
}


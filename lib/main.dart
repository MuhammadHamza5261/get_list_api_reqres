import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_list_api/bloc/get_list_bloc.dart';
import 'package:get_list_api/bloc/single_resource_bloc/single_resource_bloc.dart';
import 'package:get_list_api/screens/show_list_Screen.dart';
import 'package:get_list_api/screens/show_resource_list.dart';

 void main(){
    runApp(
      MultiBlocProvider(
          providers:[

             BlocProvider<GetListBloc>(create: (context) => GetListBloc(),),
             BlocProvider<SingleResourceBloc>(create: (context) => SingleResourceBloc(),),

          ],
          child: MyApp(),
      ),
    );

 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ShowResourceList(),
    );
  }
}


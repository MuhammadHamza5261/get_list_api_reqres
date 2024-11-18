import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_list_api/bloc/get_list_bloc.dart';
import 'package:get_list_api/bloc/get_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/get_list_event.dart';


class ShowListScreen extends StatefulWidget {
  const ShowListScreen({super.key});

  @override
  State<ShowListScreen> createState() => _ShowListScreenState();
}

class _ShowListScreenState extends State<ShowListScreen> {


@override
  void initState() {


  BlocProvider.of<GetListBloc>(context).add(GetListDataEvent());


  }





  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Show List Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15
        ),
        child: BlocBuilder<GetListBloc,GetListState>(
          builder: (context,state){
            return state is GetListInProgressState ?
                const Center(
                   child: SpinKitFadingCircle(
                     color: Colors.orangeAccent,
                   )
                ):
                state is GetListDataIsLoadedState ?
              SingleChildScrollView(
                child: Column(
                  children: [
                      Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.getApiModel!.data!.length,
                          itemBuilder: (context,i){
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10,),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              selectedColor: Colors.grey.shade300,

                              leading: Text('${state.getApiModel!.data![i].id}'),
                              title: Text('${state.getApiModel!.data![i].name}'),
                              subtitle: Text('${state.getApiModel!.data![i].pantoneValue}'),
                              trailing: Text('${state.getApiModel!.data![i].year}'),

                            ),


                          );

                          }
                      ),
                      ),
                  ],
                ),

              ): const SizedBox();

          }

        ),
      ),
    );
  }
}

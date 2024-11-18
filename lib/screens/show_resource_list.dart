import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_list_api/bloc/single_resource_bloc/single_resource_bloc.dart';
import 'package:get_list_api/bloc/single_resource_bloc/single_resource_event.dart';
import 'package:get_list_api/bloc/single_resource_bloc/single_resource_state.dart';


class ShowResourceList extends StatefulWidget {
  const ShowResourceList({super.key});

  @override
  State<ShowResourceList> createState() => _ShowResourceListState();
}

class _ShowResourceListState extends State<ShowResourceList> {


  @override
  void initState() {

    super.initState();
    BlocProvider.of<SingleResourceBloc>(context).add(SingleResourceDataEvent());

  }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Show Resource List', style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: BlocBuilder<SingleResourceBloc,SingleResourceState>(
          builder: (context,state) {
            return state is SingleResourceInProgressState ?
            const Center(
              child: CircularProgressIndicator(),
            ) :
            state is SingleResourceDataIsLoadedState ?
              Column(
                children: [
                  ListTile(
                    leading: Text('${state.singleResourceModel!.data!.id}',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrange,
                      ),),
                    title: Text(
                      '${state.singleResourceModel!.data!.name}',
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                      ),),
                    subtitle: Text('${state.singleResourceModel!.data!.color}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    trailing: Text(
                      '${state.singleResourceModel!.data!.pantoneValue}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height*0.06,
                  ),
                 Text('${state.singleResourceModel!.support!.url}',
                   style: const TextStyle(
                     fontSize: 22,
                     color: Colors.redAccent,
                 ),),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('${state.singleResourceModel!.support!.text}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.brown,
                    ),
                  )
                ],
              ):const SizedBox();
          }




        ),
      ),
    );
  }
}


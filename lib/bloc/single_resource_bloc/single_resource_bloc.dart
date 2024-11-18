import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_list_api/bloc/single_resource_bloc/single_resource_event.dart';
import 'package:get_list_api/bloc/single_resource_bloc/single_resource_state.dart';
import 'package:get_list_api/model/single_resource_model/single_resource_model.dart';
import 'package:get_list_api/repository/single_resource_repository.dart';


class SingleResourceBloc extends Bloc<SingleResourceEvent,SingleResourceState>
{

    //  use the model
    SingleResourceModel? singleResourceModel;

    //  use the repository
    SingleResourceRepository singleResourceRepository = SingleResourceRepository();

    // call the constructor
    SingleResourceBloc():super(SingleResourceInitialState())
   {

     on<SingleResourceEvent>((event,emit) async {

       if(event is SingleResourceDataEvent)
       {

           emit(SingleResourceInProgressState());

           try{

             singleResourceModel = await singleResourceRepository.singleResourceRepositoryMethod();
             emit(SingleResourceDataIsLoadedState(singleResourceModel: singleResourceModel));


           }
           catch(e)
           {

             emit(SingleResourceFailure(e.toString()));

           }

       }

     });

   }

}
import 'package:get_list_api/bloc/get_list_event.dart';
import 'package:get_list_api/bloc/get_list_state.dart';
import 'package:get_list_api/model/get_list_model/get_list_model.dart';
import 'package:get_list_api/repository/get_list_repository.dart';
import 'package:bloc/bloc.dart';


class GetListBloc extends Bloc<GetListEvent, GetListState>
{

  // use the model
  GetApiModel? getApiModel;

  // use the repository
  GetListRepository getListRepository = GetListRepository();

  // call the constructor

  GetListBloc(): super(GetListInitialState())
  {

   on<GetListEvent>((event,emit) async{


     if(event is GetListDataEvent)

       {
         emit(GetListInProgressState());

         try{

           getApiModel = await getListRepository.getListRepository();

           emit(GetListDataIsLoadedState(getApiModel: getApiModel));

         }
             catch(e)
             {

              emit(GetListErrorState(e.toString()));

             }

       }

   });

 }

}
import 'package:get_list_api/model/get_list_model/get_list_model.dart';
import 'package:get_list_api/service/get_list_service.dart';


class GetListRepository{

   // use the model clas
  GetApiModel? getApiModel;

   // use the service class
  GetListService getListService = GetListService();

  //    create a repository method

  Future<GetApiModel?> getListRepository() async{
     // set the data
     getApiModel = await getListService.getListMethod();
     return getApiModel!;

    }

}
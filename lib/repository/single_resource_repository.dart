import 'package:get_list_api/model/single_resource_model/single_resource_model.dart';
import 'package:get_list_api/service/single_resource_service.dart';


class SingleResourceRepository{

  //   use the model
  SingleResourceModel? singleResourceModel;

  // use the service class
  SingleResourceService singleResourceService = SingleResourceService();


  // create a method
  Future<SingleResourceModel?> singleResourceRepositoryMethod() async{

    singleResourceModel = await singleResourceService.singleResourceServiceMethod();
    return singleResourceModel!;

  }

}
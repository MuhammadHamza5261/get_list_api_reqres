import 'package:get_list_api/model/single_resource_model/single_resource_model.dart';

abstract class SingleResourceState{}

class SingleResourceInitialState extends SingleResourceState{}

class SingleResourceInProgressState extends SingleResourceState{}

class SingleResourceDataIsLoadedState extends SingleResourceState{

  SingleResourceModel? singleResourceModel;
  SingleResourceDataIsLoadedState({required this.singleResourceModel});

}

class SingleResourceFailure extends SingleResourceState{

  final String errorMessage;
  SingleResourceFailure(this.errorMessage);


}
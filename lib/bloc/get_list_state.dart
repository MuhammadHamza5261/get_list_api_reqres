import 'package:get_list_api/model/get_list_model/get_list_model.dart';

abstract class GetListState{}


class GetListInitialState extends GetListState{}


class GetListInProgressState extends GetListState{}

class GetListDataIsLoadedState extends GetListState{

  GetApiModel? getApiModel;
  GetListDataIsLoadedState({required this.getApiModel});

}

class GetListErrorState extends GetListState {

  final String errorMessage;

  GetListErrorState(this.errorMessage);

}
import 'dart:convert';
import 'package:get_list_api/model/single_resource_model/single_resource_model.dart';
import 'package:http/http.dart' as http;


class SingleResourceService{

//   now we will create a method
  Future<SingleResourceModel?> singleResourceServiceMethod() async{

    final response = await http.get(Uri.parse('https://reqres.in/api/unknown/2'),
      headers: <String, String>
      {
        "Content-type": "application/json",
        "Accept": "application/json",
      },
    );

      if(response.statusCode == 200)
      {

        final data = jsonDecode(response.body);
        return SingleResourceModel.fromJson(data);

      }

      else
      {
        throw Exception('${response.statusCode}: ${response.reasonPhrase}');

      }

  }



}
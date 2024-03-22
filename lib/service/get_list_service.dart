import 'dart:convert';
import 'package:get_list_api/model/get_list_model/get_list_model.dart';
import 'package:http/http.dart' as http;


class GetListService{

    Future<GetApiModel?> getListMethod() async{

      final response = await http.get(Uri.parse('https://reqres.in/api/unknown'),
           headers: <String, String>
          {
              "Content-type": "application/json",
                "Accept": "application/json",
           }
      );

          if(response.statusCode == 200)
               {

                    final data = jsonDecode(response.body);
                    return GetApiModel.fromJson(data);
               }

               else
                    {
                         throw Exception('${response.statusCode}: ${response.reasonPhrase}');
                    }
     }

}
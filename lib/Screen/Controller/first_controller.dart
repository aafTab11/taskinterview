import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:api_task/Screen/model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FirstController extends GetxController {
  RxBool isLoading =false.obs;

  List<UsersModel>users=[];
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UsersModel>> fetchUsers() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      users = body.map((dynamic item) => UsersModel.fromJson(item))
          .toList();
      print(body);
      isLoading.value = false;

      return users;
    }
    else {
      isLoading.value = false;
      throw Exception('Failed to load users');

    }

  }
}

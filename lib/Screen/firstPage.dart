import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contants/reuseble.dart';
import 'Controller/first_controller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = Get.put(FirstController());
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.cyan,
      centerTitle: true,
      title: Text("ListView",style: TextStyle(color: Colors.white),),
    ),
      body:
      RefreshIndicator(
        onRefresh: () async{
        await controller.fetchUsers();
        },
        child: Obx(
          ()=> controller.isLoading.value ? loadingWidget() :
          ListView.builder(
              itemCount: controller.users.length,
            itemBuilder: (BuildContext context, int index) {
              final user = controller.users[index];
              return Card(
                color: Colors.white,
                elevation: 8,
                margin: EdgeInsets.all(10),
                shadowColor: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${user.name}", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Username: ${user.username}"),
                      Text("Email: ${user.email}"),
                      Text("Phone: ${user.phone}"),
                      Text("Website: ${user.website}"),
                      Text("Address: ${user.address.street}, ${user.address.city}, ${user.address.zipcode}"),
                      Text("Company: ${user.company.name} - ${user.company.catchPhrase}"),
                    ],
                  ),
                ),
              );

            },

          ),
        ),
      ),
    );
  }
}

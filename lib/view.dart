// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class Home extends GetView<DataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('GetX API Calling',style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.toNamed("/data");
          }, 
          child: const Text("Getx Api")
        ),
      ),
    );
  }
}

class Data extends GetView<DataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('USD  Rates',style: TextStyle(fontSize: 15),),
      ),
      body: Obx((){
        if(controller.isLoading.value)
        {
          return const Center(child: CircularProgressIndicator());
        }
        else
        {
          return ListView.builder(
            itemCount: controller.usd.length,
            itemBuilder:(context, index)
            {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.withOpacity(0.5),
                  child: Text("${index+1}",style: const TextStyle(color: Colors.black),),
                ),
                title: Text(controller.usd[index]),
                trailing: Text(controller.rate[index].toString()),
              ); 
            }
          );
        }
      })
    );
  }
}
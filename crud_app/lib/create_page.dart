import 'package:crud_app/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'article_controller.dart';

class CreatePage extends StatelessWidget {
  final controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller:controller.titleCont,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller:controller.contentCont,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Submit'), 
              onPressed: (){
                controller.create();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
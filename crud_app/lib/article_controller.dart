import 'dart:convert';
import 'dart:io';

import 'package:crud_app/article_model.dart';
import 'package:crud_app/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'article_model.dart';
import 'package:http/http.dart' as http;

class ArticleController extends GetxController {
  var articleList = <Article>[].obs;

  final titleCont = TextEditingController();
  final contentCont = TextEditingController();


  final provider = ArticleProvider();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAll();
  }

  Future<List<dynamic>> getAll() async {
    final response = await http.get(Uri.parse('http://192.168.43.89:8000/article'));
    print(json.decode(response.body));
    return json.decode(response.body);

    // Response response = await provider.getAll();
    // List<Article> newArticleList = (response.body as List<dynamic>).map((e) => Article.fromJson(e)).toList();
    // articleList.assignAll(newArticleList);

  }


  void create() async {
    Response response = await provider.create({
      'title': titleCont.text,
      'content': contentCont.text
    });
    getAll();
  }

  void updateArticle(int id) async {
    Response response = await provider.update({
      'id': id,
      'title': titleCont.text,
      'content': contentCont.text
    });
    getAll();
  }

  void delete(int id) async {
     await provider.deleteArticle(<String, dynamic>{
      'id': id,
    });
    getAll();
  }
}
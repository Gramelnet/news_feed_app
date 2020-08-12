import 'package:flutter/material.dart';
import 'package:newsfeedapp/data/category_info.dart';
import 'package:newsfeedapp/data/search_type.dart';

class NewsRepository {

  Future<void> getNews({@required SearchType searchType, String keyword, Category category}) async{

    print("[Repository]searchType: $searchType / keyword: $keyword / category: ${category.nameJp}");

  }
}
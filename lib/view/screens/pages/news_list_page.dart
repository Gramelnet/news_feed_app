import 'package:flutter/material.dart';
import 'package:newsfeedapp/data/category_info.dart';
import 'package:newsfeedapp/data/search_type.dart';
import 'package:newsfeedapp/view/screens/components/category_chips.dart';
import 'package:newsfeedapp/view/screens/components/search_bar.dart';
import 'package:newsfeedapp/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            tooltip: "更新",
            onPressed: () => onRefresh(context),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SearchBar(
                  onSearch: (keyword) => getKeywordNews(context, keyword),
                ),
                CategoryChips(
                  onCategorySelected: (category) =>
                      getCategoryNews(context, category),
                ),
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> onRefresh(BuildContext context) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: viewModel.searchType,
        keyword: viewModel.keyword,
        category: viewModel.category);
    print("オンリフレッシュ！");
  }

  Future<void> getKeywordNews(BuildContext context, keyword) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
    print("ゲットキーワードニュース！");
  }

  Future<void> getCategoryNews(BuildContext context, Category category) async{
    print("ゲットカテゴリーニュース : ${category.nameJp}");
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }
}

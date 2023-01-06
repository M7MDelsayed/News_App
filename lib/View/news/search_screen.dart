import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Model/api/api_manager.dart';
import 'package:news_app/View/news/news_item.dart';

import '../../Model/news/News.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";
  List<News> newsList = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            leading: const SizedBox(),
            leadingWidth: 10,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (newQuery) {
                    setState(() {
                      query = newQuery;
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.hint,
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    contentPadding: const EdgeInsets.only(top: 10),
                  ),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(search().elementAt(index));
            },
            itemCount: search().length,
          ),
        ),
      ],
    );
  }

  List search() {
    ApiManager.getNews(query: query).then((newsResponse) {
      newsList = newsResponse.newsList ?? [];
    }).catchError((error) {
      debugPrint(error);
    });
    return newsList;
  }
}

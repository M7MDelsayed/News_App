import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/View/news/search_screen.dart';
import 'package:news_app/View/settings/settings_screen.dart';

import '../category/category_widget.dart';
import 'category_grid_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<Category> category = [
      Category(
        categoryID: "sports",
        categoryImage: "assets/images/ball.png",
        categoryTitle: AppLocalizations.of(context)!.sports,
        categoryBackground: const Color.fromARGB(255, 201, 28, 34),
      ),
      Category(
        categoryID: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: AppLocalizations.of(context)!.politics,
        categoryBackground: const Color.fromARGB(255, 0, 62, 144),
      ),
      Category(
        categoryID: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: AppLocalizations.of(context)!.health,
        categoryBackground: const Color.fromARGB(255, 237, 30, 121),
      ),
      Category(
        categoryID: "business",
        categoryImage: "assets/images/bussines.png",
        categoryTitle: AppLocalizations.of(context)!.business,
        categoryBackground: const Color.fromARGB(255, 207, 126, 72),
      ),
      Category(
        categoryID: "entertainment",
        categoryImage: "assets/images/entertainment.png",
        categoryTitle: AppLocalizations.of(context)!.entertainment,
        categoryBackground: const Color.fromARGB(255, 72, 130, 207),
      ),
      Category(
        categoryID: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: AppLocalizations.of(context)!.science,
        categoryBackground: const Color.fromARGB(255, 242, 211, 82),
      ),
    ];

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
            title: Text(
              selectedCategory == null
                  ? AppLocalizations.of(context)!.news
                  : selectedCategory!.categoryTitle,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                  ),
            ),
            actions: [
              selectedCategory != null
                  ? IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      icon: const Icon(Icons.search))
                  : const SizedBox(),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.news,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = null;
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.list,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.categories,
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: selectedCategory == null
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.choose,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.black54,
                            ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 6 / 7,
                          ),
                          itemBuilder: (context, index) => CategoryGridView(
                            index: index,
                            category: category[index],
                            onClickItem: onClick,
                          ),
                          itemCount: category.length,
                        ),
                      ),
                    ],
                  ),
                )
              : CategoryWidget(selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

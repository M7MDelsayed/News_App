import 'package:flutter/material.dart';
import 'package:news_app/View/category/source_tab_item.dart';

import '../../Model/sources/Source.dart';
import '../news/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map(
                    (source) => SourceTabItem(
                      source,
                      widget.sources.indexOf(source) == selectedIndex,
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: NewsList(widget.sources[selectedIndex]),
            ),
          ],
        ),
      ),
    );
  }
}

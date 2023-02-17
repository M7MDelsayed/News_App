import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/View/news/published_date.dart';

import '../../Model/news/News.dart';
import 'news_details.dart';

class NewsItem extends StatelessWidget {
  News? news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName, arguments: news);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                height: 200,
                width: double.infinity,
                imageUrl: news?.urlToImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news?.author ?? '',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color(0xFF707070),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news?.title ?? '',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              publishedAt(news!),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Color(0xFF707070),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

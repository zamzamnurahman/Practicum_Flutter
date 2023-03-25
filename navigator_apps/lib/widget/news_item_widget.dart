import 'package:flutter/material.dart';

import '../models/news.dart';

class NewsItemWidget extends StatelessWidget {
  NewsItemWidget({
    super.key,
    required this.news,
  });

  News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        leading: Image.network(news.image!),
        title: Text(news.title!),
        subtitle: Text(
          news.description!,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

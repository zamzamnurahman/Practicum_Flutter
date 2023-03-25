import 'package:flutter/material.dart';

import '../../data/news_data.dart';

class LatesNewsWidget extends StatelessWidget {
  const LatesNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Lates News"),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
              children: List.generate(
                  3,
                  (int i) => Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          leading: Image.network(newsData[i].image!),
                          title: Text(newsData[i].title!),
                          subtitle: Text(
                            newsData[i].description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ))),
        )
      ],
    );
  }
}

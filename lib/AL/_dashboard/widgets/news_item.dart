// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../constaints.dart';
import '../../pages/model.dart';

class NewsItem extends StatelessWidget {
  final News data;
  const NewsItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: primaryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: primary,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(data.imgUrl))),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  data.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  data.time,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

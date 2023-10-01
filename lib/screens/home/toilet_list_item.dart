// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:public_toilets/modles/toilet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ToiletListItem extends StatelessWidget {
  final Toilet toilet;

  const ToiletListItem({
    super.key,
    required this.toilet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.home,
              size: 30.0,
            ),
            Expanded(
              child: Text(
                toilet.name,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if (toilet.point > 3)
                      Text('GOOD'),

                    // for (var i = 0; i < toilet.point.round(); i++)
                    //   Icon(Icons.star),

                    RatingBarIndicator(
                      rating: toilet.point,
                      direction: Axis.horizontal,
                      itemSize: 35,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ),

                    Text(toilet.point.toString()),
                  ],
                ),
                Text(toilet.distance.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
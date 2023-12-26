import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../screens/detail_screen.dart';

class PopularMovie extends StatelessWidget {
  final MovieProfile profile;

  const PopularMovie({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: profile.id)));
      },
      child: Container(
          width: 280,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //boxShadow: [BoxShadow(blurRadius: 0, offset: const Offset(0, 0), color: Colors.black.withOpacity(0.7))]
          ),
          child: Image.network(
            profile.backdropPath,
            headers: const {
              'User-Agent':
                  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
              'Referer': 'https://comic.naver.com',
            },
            errorBuilder: (context, exception, stackTrace) {
              print("Exception >> ${exception.toString()}");
              return Text("error");
            },
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

import '../models/movie_model.dart';

class ComingSoonMovie extends StatelessWidget {
  final MovieProfile profile;

  const ComingSoonMovie({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: profile.id)));
      },
      child: Container(
          width: 100,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //boxShadow: [BoxShadow(blurRadius: 1, offset: const Offset(1, 1), color: Colors.black.withOpacity(0.7))]
          ),
          child: Column(
            children: [
              Image.network(
                profile.posterPath,
                headers: const {
                  'User-Agent':
                      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                  'Referer': 'https://comic.naver.com',
                },
                errorBuilder: (context, exception, stackTrace) {
                  print("Exception >> ${exception.toString()}");
                  return Text("error");
                },
              ),
              Text(
                '${profile.releaseDate} / ${profile.title}',
                style: TextStyle(fontSize: 10),
              ),
            ],
          )),
    );
  }
}

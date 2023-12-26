import 'package:flutter/material.dart';
import 'package:movieflix/services/movie_api_service.dart';
import 'package:movieflix/widgets/now_in_cinema_movie_widget.dart';

import '../models/movie_model.dart';
import '../widgets/coming_soon_movie_widget.dart';
import '../widgets/popular_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<MovieProfile>> moviesPopular = MovieApiService().getPopular();
  Future<List<MovieProfile>> moviesNowInCinema = MovieApiService().getNowInCinema();
  Future<List<MovieProfile>> moviesComingSoon = MovieApiService().getComingSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Movies",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: FutureBuilder(
                      future: moviesPopular,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(child: buildPopularMovieList(snapshot)),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Now In Cinema",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: 230,
                  child: FutureBuilder(
                      future: moviesNowInCinema,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(child: buildNowInCinemaMovieList(snapshot)),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coming Soon",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: 230,
                  child: FutureBuilder(
                      future: moviesComingSoon,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(child: buildComingSoonMovieList(snapshot)),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildPopularMovieList(AsyncSnapshot<List<MovieProfile>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        var movieProfile = snapshot.data![index];
        return PopularMovie(
            profile: movieProfile); // WebtoonThumb(id: webtoon.id, title: webtoon.title, thumbUrl: webtoon.thumb);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10,
        );
      },
    );
  }

  ListView buildNowInCinemaMovieList(AsyncSnapshot<List<MovieProfile>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        var movieProfile = snapshot.data![index];
        return NowInCinemaMovie(
            profile: movieProfile); // WebtoonThumb(id: webtoon.id, title: webtoon.title, thumbUrl: webtoon.thumb);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10,
        );
      },
    );
  }

  ListView buildComingSoonMovieList(AsyncSnapshot<List<MovieProfile>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        var movieProfile = snapshot.data![index];
        return ComingSoonMovie(
            profile: movieProfile); // WebtoonThumb(id: webtoon.id, title: webtoon.title, thumbUrl: webtoon.thumb);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10,
        );
      },
    );
  }
}

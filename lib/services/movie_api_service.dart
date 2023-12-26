import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class MovieApiService {
  final String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  final String uriPopular = 'popular';
  final String uriNowInCinema = 'now-playing';
  final String uriComingSoon = 'coming-soon';
  final String uriMovieDetail = 'movie';

  Future<List<MovieProfile>> getPopular() async {
    final url = Uri.parse('$baseUrl/$uriPopular');
    final response = await http.get(url);

    List<MovieProfile> moviesPopular = [];
    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['results'];
      for (var result in results) {
        moviesPopular.add(MovieProfile.fromJson(result));
      }
      return moviesPopular;
    }

    throw Error();
  }

  Future<List<MovieProfile>> getNowInCinema() async {
    final url = Uri.parse('$baseUrl/$uriNowInCinema');
    final response = await http.get(url);

    List<MovieProfile> moviesNowInCinema = [];
    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['results'];
      for (var result in results) {
        moviesNowInCinema.add(MovieProfile.fromJson(result));
      }
      return moviesNowInCinema;
    }

    throw Error();
  }

  Future<List<MovieProfile>> getComingSoon() async {
    final url = Uri.parse('$baseUrl/$uriComingSoon');
    final response = await http.get(url);

    List<MovieProfile> moviesComingSoon = [];
    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['results'];
      for (var result in results) {
        moviesComingSoon.add(MovieProfile.fromJson(result));
      }
      return moviesComingSoon;
    }

    throw Error();
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    final url = Uri.parse('$baseUrl/$uriMovieDetail?id=${id.toString()}');
    final response = await http.get(url);

    List<MovieProfile> moviesComingSoon = [];
    if (response.statusCode == 200) {
      MovieDetail detail = MovieDetail.fromJson(jsonDecode(response.body));
      return detail;
    }
    throw Error();
  }
}

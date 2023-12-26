class Genre {
  final int id;
  final String name;
  Genre({required this.id, required this.name});
}

class MovieProfile {
  final int id;
  final String title;
  final String originalTitle;
  final bool adult;
  // final List<MovieGenre> genres;
  final String originalLanguage;
  final double popularity;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final String overview;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieProfile.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        originalTitle = json["original_title"],
        adult = json["adult"],
        originalLanguage = json["original_language"],
        popularity = json["popularity"],
        backdropPath = 'https://image.tmdb.org/t/p/w500/${json['backdrop_path']}',
        posterPath = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        releaseDate = json["release_date"],
        overview = json["overview"],
        video = json["video"],
        voteAverage = json["vote_average"],
        voteCount = json["vote_count"]; //,
}

class MovieDetail {
  late final int id;
  late final String title;
  late final List<Genre> genres = [];
  late final int runTime;
  late final String overview;
  late final double voteAverage;
  late final String backdropPath;
  late final String posterPath;

  MovieDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    overview = json["overview"];
    runTime = json["runtime"];
    voteAverage = json["vote_average"]; //,
    backdropPath = 'https://image.tmdb.org/t/p/w500/${json['backdrop_path']}';
    posterPath = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}';
    for (var generJson in json["genres"]) {
      genres.add(Genre(id: generJson['id'], name: generJson['name']));
    }
  }
}

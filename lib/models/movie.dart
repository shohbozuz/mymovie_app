class movie {
  int? id;
  String? movieImg;
  String? movieName;
  String? stateName;
  String? movieDuration;
  String? movieLang;
  String? movieCode;
  String? movieTreyler;
  String? moviePlay;
  String? movieDescription;
  String? movieDiskleyer;
  String? createdAt;
  int? category;

  movie(
      {this.id,
        this.movieImg,
        this.movieName,
        this.stateName,
        this.movieDuration,
        this.movieLang,
        this.movieCode,
        this.movieTreyler,
        this.moviePlay,
        this.movieDescription,
        this.movieDiskleyer,
        this.createdAt,
        this.category});

  movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieImg = json['movie_img'];
    movieName = json['movie_name'];
    stateName = json['state_name'];
    movieDuration = json['movie_duration'];
    movieLang = json['movie_lang'];
    movieCode = json['movie_code'];
    movieTreyler = json['movie_treyler'];
    moviePlay = json['movie_play'];
    movieDescription = json['movie_description'];
    movieDiskleyer = json['movie_diskleyer'];
    createdAt = json['created_at'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movie_img'] = this.movieImg;
    data['movie_name'] = this.movieName;
    data['state_name'] = this.stateName;
    data['movie_duration'] = this.movieDuration;
    data['movie_lang'] = this.movieLang;
    data['movie_code'] = this.movieCode;
    data['movie_treyler'] = this.movieTreyler;
    data['movie_play'] = this.moviePlay;
    data['movie_description'] = this.movieDescription;
    data['movie_diskleyer'] = this.movieDiskleyer;
    data['created_at'] = this.createdAt;
    data['category'] = this.category;
    return data;
  }
}

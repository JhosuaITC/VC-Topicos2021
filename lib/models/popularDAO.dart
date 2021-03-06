class Popular {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
}

class Results {
  int? vote_count;
  String? poster_paht;
  String? backdrop_path;
  String? title;
  int? id;
  String? overview;
  String? release_date;

  Results(this.vote_count, this.poster_paht, this.backdrop_path, this.title,
      this.id, this.overview, this.release_date);

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      map['vote_count'],
      map['poster_path'],
      map['bacdrop_path'],
      map['title'],
      map['id'],
      map['overview'],
      map['release_date'],
    );
  }
}

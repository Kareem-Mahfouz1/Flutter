import 'package:equatable/equatable.dart';

class MovieItem extends Equatable {
  final int? rank;
  final String? title;
  final String? description;
  final String? image;
  final String? bigImage;
  final List<dynamic>? genre;
  final String? thumbnail;
  final String? rating;
  final String? id;
  final int? year;
  final String? imdbid;
  final String? imdbLink;

  const MovieItem({
    this.rank,
    this.title,
    this.description,
    this.image,
    this.bigImage,
    this.genre,
    this.thumbnail,
    this.rating,
    this.id,
    this.year,
    this.imdbid,
    this.imdbLink,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) => MovieItem(
        rank: json['rank'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        bigImage: json['big_image'] as String?,
        genre: json['genre'],
        thumbnail: json['thumbnail'] as String?,
        rating: json['rating'] as String?,
        id: json['id'] as String?,
        year: json['year'] as int?,
        imdbid: json['imdbid'] as String?,
        imdbLink: json['imdb_link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rank': rank,
        'title': title,
        'description': description,
        'image': image,
        'big_image': bigImage,
        'genre': genre,
        'thumbnail': thumbnail,
        'rating': rating,
        'id': id,
        'year': year,
        'imdbid': imdbid,
        'imdb_link': imdbLink,
      };

  @override
  List<Object?> get props {
    return [
      rank,
      title,
      description,
      image,
      bigImage,
      genre,
      thumbnail,
      rating,
      id,
      year,
      imdbid,
      imdbLink,
    ];
  }
}

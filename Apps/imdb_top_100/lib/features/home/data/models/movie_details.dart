import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int? rank;
  final String? title;
  final String? thumbnail;
  final String? rating;
  final String? id;
  final int? year;
  final String? image;
  final String? bigImage;
  final String? description;
  final String? trailer;
  final String? trailerEmbedLink;
  final String? trailerYoutubeId;
  final List<String>? genre;
  final List<String>? director;
  final List<String>? writers;
  final String? imdbid;
  final String? imdbLink;

  const MovieDetails({
    this.rank,
    this.title,
    this.thumbnail,
    this.rating,
    this.id,
    this.year,
    this.image,
    this.bigImage,
    this.description,
    this.trailer,
    this.trailerEmbedLink,
    this.trailerYoutubeId,
    this.genre,
    this.director,
    this.writers,
    this.imdbid,
    this.imdbLink,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        rank: json['rank'] as int?,
        title: json['title'] as String?,
        thumbnail: json['thumbnail'] as String?,
        rating: json['rating'] as String?,
        id: json['id'] as String?,
        year: json['year'] as int?,
        image: json['image'] as String?,
        bigImage: json['big_image'] as String?,
        description: json['description'] as String?,
        trailer: json['trailer'] as String?,
        trailerEmbedLink: json['trailer_embed_link'] as String?,
        trailerYoutubeId: json['trailer_youtube_id'] as String?,
        genre: json['genre'] as List<String>?,
        director: json['director'] as List<String>?,
        writers: json['writers'] as List<String>?,
        imdbid: json['imdbid'] as String?,
        imdbLink: json['imdb_link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rank': rank,
        'title': title,
        'thumbnail': thumbnail,
        'rating': rating,
        'id': id,
        'year': year,
        'image': image,
        'big_image': bigImage,
        'description': description,
        'trailer': trailer,
        'trailer_embed_link': trailerEmbedLink,
        'trailer_youtube_id': trailerYoutubeId,
        'genre': genre,
        'director': director,
        'writers': writers,
        'imdbid': imdbid,
        'imdb_link': imdbLink,
      };

  @override
  List<Object?> get props {
    return [
      rank,
      title,
      thumbnail,
      rating,
      id,
      year,
      image,
      bigImage,
      description,
      trailer,
      trailerEmbedLink,
      trailerYoutubeId,
      genre,
      director,
      writers,
      imdbid,
      imdbLink,
    ];
  }
}

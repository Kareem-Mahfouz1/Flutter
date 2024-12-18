import 'package:equatable/equatable.dart';

class SeriesItem extends Equatable {
  final int? rank;
  final String? title;
  final String? thumbnail;
  final double? rating;
  final String? id;
  final String? year;
  final String? image;
  final String? bigImage;
  final String? description;
  final String? trailer;
  final String? trailerEmbedLink;
  final String? trailerYoutubeId;
  final List<String>? genre;
  final String? imdbid;
  final String? imdbLink;

  const SeriesItem({
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
    this.imdbid,
    this.imdbLink,
  });

  factory SeriesItem.fromJson(Map<String, dynamic> json) => SeriesItem(
        rank: json['rank'] as int?,
        title: json['title'] as String?,
        thumbnail: json['thumbnail'] as String?,
        rating: json['rating'] as double?,
        id: json['id'] as String?,
        year: json['year'] as String?,
        image: json['image'] as String?,
        bigImage: json['big_image'] as String?,
        description: json['description'] as String?,
        trailer: json['trailer'] as String?,
        trailerEmbedLink: json['trailer_embed_link'] as String?,
        trailerYoutubeId: json['trailer_youtube_id'] as String?,
        genre: json['genre'] as List<String>?,
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
      imdbid,
      imdbLink,
    ];
  }
}

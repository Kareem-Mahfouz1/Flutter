import 'package:equatable/equatable.dart';

class Campaigns extends Equatable {
  final List<dynamic>? imageTiles;
  final List<dynamic>? promoBanners;
  final List<dynamic>? sponsoredProducts;

  const Campaigns({
    this.imageTiles,
    this.promoBanners,
    this.sponsoredProducts,
  });

  factory Campaigns.fromJson(Map<String, dynamic> json) => Campaigns(
        imageTiles: json['imageTiles'] as List<dynamic>?,
        promoBanners: json['promoBanners'] as List<dynamic>?,
        sponsoredProducts: json['sponsoredProducts'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'imageTiles': imageTiles,
        'promoBanners': promoBanners,
        'sponsoredProducts': sponsoredProducts,
      };

  @override
  List<Object?> get props {
    return [
      imageTiles,
      promoBanners,
      sponsoredProducts,
    ];
  }
}

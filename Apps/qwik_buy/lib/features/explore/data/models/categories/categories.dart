import 'package:equatable/equatable.dart';

import 'brand.dart';
import 'footer.dart';
import 'navigation.dart';

class Categories extends Equatable {
  final List<Navigation>? navigation;
  final List<Brand>? brands;
  final List<Footer>? footer;

  const Categories({this.navigation, this.brands, this.footer});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        navigation: (json['navigation'] as List<dynamic>?)
            ?.map((e) => Navigation.fromJson(e as Map<String, dynamic>))
            .toList(),
        brands: (json['brands'] as List<dynamic>?)
            ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
            .toList(),
        footer: (json['footer'] as List<dynamic>?)
            ?.map((e) => Footer.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'navigation': navigation?.map((e) => e.toJson()).toList(),
        'brands': brands?.map((e) => e.toJson()).toList(),
        'footer': footer?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [navigation, brands, footer];
}

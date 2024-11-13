import 'package:equatable/equatable.dart';

import 'product.dart';

class FacetGrouping extends Equatable {
  final List<Product>? products;
  final String? type;

  const FacetGrouping({this.products, this.type});

  factory FacetGrouping.fromJson(Map<String, dynamic> json) => FacetGrouping(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'type': type,
      };

  @override
  List<Object?> get props => [products, type];
}

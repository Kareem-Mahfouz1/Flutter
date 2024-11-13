import 'package:equatable/equatable.dart';

import 'campaigns.dart';
import 'diagnostics.dart';
import 'facet.dart';
import 'product.dart';
import 'search_pass_meta.dart';

class Result extends Equatable {
  final String? searchTerm;
  final String? categoryName;
  final int? itemCount;
  final String? redirectUrl;
  final List<Product>? products;
  final List<Facet>? facets;
  final Diagnostics? diagnostics;
  final SearchPassMeta? searchPassMeta;
  final dynamic queryId;
  final List<dynamic>? discoverSearchProductTypes;
  final Campaigns? campaigns;

  const Result({
    this.searchTerm,
    this.categoryName,
    this.itemCount,
    this.redirectUrl,
    this.products,
    this.facets,
    this.diagnostics,
    this.searchPassMeta,
    this.queryId,
    this.discoverSearchProductTypes,
    this.campaigns,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        searchTerm: json['searchTerm'] as String?,
        categoryName: json['categoryName'] as String?,
        itemCount: json['itemCount'] as int?,
        redirectUrl: json['redirectUrl'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        facets: (json['facets'] as List<dynamic>?)
            ?.map((e) => Facet.fromJson(e as Map<String, dynamic>))
            .toList(),
        diagnostics: json['diagnostics'] == null
            ? null
            : Diagnostics.fromJson(json['diagnostics'] as Map<String, dynamic>),
        searchPassMeta: json['searchPassMeta'] == null
            ? null
            : SearchPassMeta.fromJson(
                json['searchPassMeta'] as Map<String, dynamic>),
        queryId: json['queryId'] as dynamic,
        discoverSearchProductTypes:
            json['discoverSearchProductTypes'] as List<dynamic>?,
        campaigns: json['campaigns'] == null
            ? null
            : Campaigns.fromJson(json['campaigns'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'searchTerm': searchTerm,
        'categoryName': categoryName,
        'itemCount': itemCount,
        'redirectUrl': redirectUrl,
        'products': products?.map((e) => e.toJson()).toList(),
        'facets': facets?.map((e) => e.toJson()).toList(),
        'diagnostics': diagnostics?.toJson(),
        'searchPassMeta': searchPassMeta?.toJson(),
        'queryId': queryId,
        'discoverSearchProductTypes': discoverSearchProductTypes,
        'campaigns': campaigns?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      searchTerm,
      categoryName,
      itemCount,
      redirectUrl,
      products,
      facets,
      diagnostics,
      searchPassMeta,
      queryId,
      discoverSearchProductTypes,
      campaigns,
    ];
  }
}

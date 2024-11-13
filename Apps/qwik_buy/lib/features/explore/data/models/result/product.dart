import 'package:equatable/equatable.dart';

import 'facet_grouping.dart';
import 'price.dart';

class Product extends Equatable {
  final int? id;
  final String? name;
  final Price? price;
  final String? colour;
  final int? colourWayId;
  final String? brandName;
  final bool? hasVariantColours;
  final bool? hasMultiplePrices;
  final dynamic groupId;
  final int? productCode;
  final String? productType;
  final String? url;
  final String? imageUrl;
  final List<String>? additionalImageUrls;
  final dynamic videoUrl;
  final bool? showVideo;
  final bool? isSellingFast;
  final bool? isRestockingSoon;
  final bool? isPromotion;
  final dynamic sponsoredCampaignId;
  final List<FacetGrouping>? facetGroupings;
  final dynamic advertisement;

  const Product({
    this.id,
    this.name,
    this.price,
    this.colour,
    this.colourWayId,
    this.brandName,
    this.hasVariantColours,
    this.hasMultiplePrices,
    this.groupId,
    this.productCode,
    this.productType,
    this.url,
    this.imageUrl,
    this.additionalImageUrls,
    this.videoUrl,
    this.showVideo,
    this.isSellingFast,
    this.isRestockingSoon,
    this.isPromotion,
    this.sponsoredCampaignId,
    this.facetGroupings,
    this.advertisement,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        colour: json['colour'] as String?,
        colourWayId: json['colourWayId'] as int?,
        brandName: json['brandName'] as String?,
        hasVariantColours: json['hasVariantColours'] as bool?,
        hasMultiplePrices: json['hasMultiplePrices'] as bool?,
        groupId: json['groupId'] as dynamic,
        productCode: json['productCode'] as int?,
        productType: json['productType'] as String?,
        url: json['url'] as String?,
        imageUrl: json['imageUrl'] as String?,
        additionalImageUrls: json['additionalImageUrls'] as List<String>?,
        videoUrl: json['videoUrl'] as dynamic,
        showVideo: json['showVideo'] as bool?,
        isSellingFast: json['isSellingFast'] as bool?,
        isRestockingSoon: json['isRestockingSoon'] as bool?,
        isPromotion: json['isPromotion'] as bool?,
        sponsoredCampaignId: json['sponsoredCampaignId'] as dynamic,
        facetGroupings: (json['facetGroupings'] as List<dynamic>?)
            ?.map((e) => FacetGrouping.fromJson(e as Map<String, dynamic>))
            .toList(),
        advertisement: json['advertisement'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price?.toJson(),
        'colour': colour,
        'colourWayId': colourWayId,
        'brandName': brandName,
        'hasVariantColours': hasVariantColours,
        'hasMultiplePrices': hasMultiplePrices,
        'groupId': groupId,
        'productCode': productCode,
        'productType': productType,
        'url': url,
        'imageUrl': imageUrl,
        'additionalImageUrls': additionalImageUrls,
        'videoUrl': videoUrl,
        'showVideo': showVideo,
        'isSellingFast': isSellingFast,
        'isRestockingSoon': isRestockingSoon,
        'isPromotion': isPromotion,
        'sponsoredCampaignId': sponsoredCampaignId,
        'facetGroupings': facetGroupings?.map((e) => e.toJson()).toList(),
        'advertisement': advertisement,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      price,
      colour,
      colourWayId,
      brandName,
      hasVariantColours,
      hasMultiplePrices,
      groupId,
      productCode,
      productType,
      url,
      imageUrl,
      additionalImageUrls,
      videoUrl,
      showVideo,
      isSellingFast,
      isRestockingSoon,
      isPromotion,
      sponsoredCampaignId,
      facetGroupings,
      advertisement,
    ];
  }
}

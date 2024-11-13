import 'package:equatable/equatable.dart';

class CurationAnalytics extends Equatable {
  final int? status;
  final int? numberOfCuratedItems;
  final List<dynamic>? elevatedItems;
  final List<dynamic>? fixedItems;
  final List<dynamic>? comingSoonItems;
  final List<dynamic>? advertisementPositions;
  final List<dynamic>? marketingItems;

  const CurationAnalytics({
    this.status,
    this.numberOfCuratedItems,
    this.elevatedItems,
    this.fixedItems,
    this.comingSoonItems,
    this.advertisementPositions,
    this.marketingItems,
  });

  factory CurationAnalytics.fromJson(Map<String, dynamic> json) {
    return CurationAnalytics(
      status: json['status'] as int?,
      numberOfCuratedItems: json['numberOfCuratedItems'] as int?,
      elevatedItems: json['elevatedItems'] as List<dynamic>?,
      fixedItems: json['fixedItems'] as List<dynamic>?,
      comingSoonItems: json['comingSoonItems'] as List<dynamic>?,
      advertisementPositions: json['advertisementPositions'] as List<dynamic>?,
      marketingItems: json['marketingItems'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'numberOfCuratedItems': numberOfCuratedItems,
        'elevatedItems': elevatedItems,
        'fixedItems': fixedItems,
        'comingSoonItems': comingSoonItems,
        'advertisementPositions': advertisementPositions,
        'marketingItems': marketingItems,
      };

  @override
  List<Object?> get props {
    return [
      status,
      numberOfCuratedItems,
      elevatedItems,
      fixedItems,
      comingSoonItems,
      advertisementPositions,
      marketingItems,
    ];
  }
}

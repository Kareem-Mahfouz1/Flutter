import 'package:equatable/equatable.dart';

class RecommendationsAnalytics extends Equatable {
  final int? personalisationStatus;
  final int? numberOfItems;
  final int? numberOfRecs;
  final String? personalisationType;
  final String? experimentTrackerkey;
  final List<dynamic>? items;

  const RecommendationsAnalytics({
    this.personalisationStatus,
    this.numberOfItems,
    this.numberOfRecs,
    this.personalisationType,
    this.experimentTrackerkey,
    this.items,
  });

  factory RecommendationsAnalytics.fromJson(Map<String, dynamic> json) {
    return RecommendationsAnalytics(
      personalisationStatus: json['personalisationStatus'] as int?,
      numberOfItems: json['numberOfItems'] as int?,
      numberOfRecs: json['numberOfRecs'] as int?,
      personalisationType: json['personalisationType'] as String?,
      experimentTrackerkey: json['experimentTrackerkey'] as String?,
      items: json['items'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'personalisationStatus': personalisationStatus,
        'numberOfItems': numberOfItems,
        'numberOfRecs': numberOfRecs,
        'personalisationType': personalisationType,
        'experimentTrackerkey': experimentTrackerkey,
        'items': items,
      };

  @override
  List<Object?> get props {
    return [
      personalisationStatus,
      numberOfItems,
      numberOfRecs,
      personalisationType,
      experimentTrackerkey,
      items,
    ];
  }
}

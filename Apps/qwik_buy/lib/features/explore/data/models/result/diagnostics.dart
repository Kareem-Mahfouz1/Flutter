import 'package:equatable/equatable.dart';

import 'advertisements_analytics.dart';
import 'curation_analytics.dart';
import 'recommendations_analytics.dart';

class Diagnostics extends Equatable {
  final String? requestId;
  final int? processingTime;
  final int? queryTime;
  final bool? recommendationsEnabled;
  final RecommendationsAnalytics? recommendationsAnalytics;
  final bool? advertisementsEnabled;
  final AdvertisementsAnalytics? advertisementsAnalytics;
  final CurationAnalytics? curationAnalytics;

  const Diagnostics({
    this.requestId,
    this.processingTime,
    this.queryTime,
    this.recommendationsEnabled,
    this.recommendationsAnalytics,
    this.advertisementsEnabled,
    this.advertisementsAnalytics,
    this.curationAnalytics,
  });

  factory Diagnostics.fromJson(Map<String, dynamic> json) => Diagnostics(
        requestId: json['requestId'] as String?,
        processingTime: json['processingTime'] as int?,
        queryTime: json['queryTime'] as int?,
        recommendationsEnabled: json['recommendationsEnabled'] as bool?,
        recommendationsAnalytics: json['recommendationsAnalytics'] == null
            ? null
            : RecommendationsAnalytics.fromJson(
                json['recommendationsAnalytics'] as Map<String, dynamic>),
        advertisementsEnabled: json['advertisementsEnabled'] as bool?,
        advertisementsAnalytics: json['advertisementsAnalytics'] == null
            ? null
            : AdvertisementsAnalytics.fromJson(
                json['advertisementsAnalytics'] as Map<String, dynamic>),
        curationAnalytics: json['curationAnalytics'] == null
            ? null
            : CurationAnalytics.fromJson(
                json['curationAnalytics'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'requestId': requestId,
        'processingTime': processingTime,
        'queryTime': queryTime,
        'recommendationsEnabled': recommendationsEnabled,
        'recommendationsAnalytics': recommendationsAnalytics?.toJson(),
        'advertisementsEnabled': advertisementsEnabled,
        'advertisementsAnalytics': advertisementsAnalytics?.toJson(),
        'curationAnalytics': curationAnalytics?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      requestId,
      processingTime,
      queryTime,
      recommendationsEnabled,
      recommendationsAnalytics,
      advertisementsEnabled,
      advertisementsAnalytics,
      curationAnalytics,
    ];
  }
}

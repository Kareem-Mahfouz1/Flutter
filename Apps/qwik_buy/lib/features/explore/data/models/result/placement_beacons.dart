import 'package:equatable/equatable.dart';

class PlacementBeacons extends Equatable {
  final dynamic onLoadBeacon;
  final dynamic onViewBeacon;

  const PlacementBeacons({this.onLoadBeacon, this.onViewBeacon});

  factory PlacementBeacons.fromJson(Map<String, dynamic> json) {
    return PlacementBeacons(
      onLoadBeacon: json['onLoadBeacon'] as dynamic,
      onViewBeacon: json['onViewBeacon'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'onLoadBeacon': onLoadBeacon,
        'onViewBeacon': onViewBeacon,
      };

  @override
  List<Object?> get props => [onLoadBeacon, onViewBeacon];
}

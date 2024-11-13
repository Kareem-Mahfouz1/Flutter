import 'package:equatable/equatable.dart';

import 'placement_beacons.dart';

class AdvertisementsAnalytics extends Equatable {
  final int? status;
  final bool? customerOptIn;
  final int? numberOfItemsFromPartner;
  final List<dynamic>? items;
  final List<dynamic>? itemsFromPartner;
  final PlacementBeacons? placementBeacons;

  const AdvertisementsAnalytics({
    this.status,
    this.customerOptIn,
    this.numberOfItemsFromPartner,
    this.items,
    this.itemsFromPartner,
    this.placementBeacons,
  });

  factory AdvertisementsAnalytics.fromJson(Map<String, dynamic> json) {
    return AdvertisementsAnalytics(
      status: json['status'] as int?,
      customerOptIn: json['customerOptIn'] as bool?,
      numberOfItemsFromPartner: json['numberOfItemsFromPartner'] as int?,
      items: json['items'] as List<dynamic>?,
      itemsFromPartner: json['itemsFromPartner'] as List<dynamic>?,
      placementBeacons: json['placementBeacons'] == null
          ? null
          : PlacementBeacons.fromJson(
              json['placementBeacons'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'customerOptIn': customerOptIn,
        'numberOfItemsFromPartner': numberOfItemsFromPartner,
        'items': items,
        'itemsFromPartner': itemsFromPartner,
        'placementBeacons': placementBeacons?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      status,
      customerOptIn,
      numberOfItemsFromPartner,
      items,
      itemsFromPartner,
      placementBeacons,
    ];
  }
}

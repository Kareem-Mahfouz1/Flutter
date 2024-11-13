import 'package:equatable/equatable.dart';

import 'current.dart';
import 'lowest_price_in_last30_days.dart';
import 'previous.dart';
import 'rrp.dart';

class Price extends Equatable {
  final Current? current;
  final Previous? previous;
  final Rrp? rrp;
  final LowestPriceInLast30Days? lowestPriceInLast30Days;
  final bool? isMarkedDown;
  final bool? isOutletPrice;
  final String? currency;

  const Price({
    this.current,
    this.previous,
    this.rrp,
    this.lowestPriceInLast30Days,
    this.isMarkedDown,
    this.isOutletPrice,
    this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        previous: json['previous'] == null
            ? null
            : Previous.fromJson(json['previous'] as Map<String, dynamic>),
        rrp: json['rrp'] == null
            ? null
            : Rrp.fromJson(json['rrp'] as Map<String, dynamic>),
        lowestPriceInLast30Days: json['lowestPriceInLast30Days'] == null
            ? null
            : LowestPriceInLast30Days.fromJson(
                json['lowestPriceInLast30Days'] as Map<String, dynamic>),
        isMarkedDown: json['isMarkedDown'] as bool?,
        isOutletPrice: json['isOutletPrice'] as bool?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'current': current?.toJson(),
        'previous': previous?.toJson(),
        'rrp': rrp?.toJson(),
        'lowestPriceInLast30Days': lowestPriceInLast30Days?.toJson(),
        'isMarkedDown': isMarkedDown,
        'isOutletPrice': isOutletPrice,
        'currency': currency,
      };

  @override
  List<Object?> get props {
    return [
      current,
      previous,
      rrp,
      lowestPriceInLast30Days,
      isMarkedDown,
      isOutletPrice,
      currency,
    ];
  }
}

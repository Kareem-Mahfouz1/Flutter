import 'package:equatable/equatable.dart';

import 'facet_value.dart';

class Facet extends Equatable {
  final String? id;
  final String? name;
  final List<FacetValue>? facetValues;
  final String? displayStyle;
  final String? facetType;
  final bool? hasSelectedValues;

  const Facet({
    this.id,
    this.name,
    this.facetValues,
    this.displayStyle,
    this.facetType,
    this.hasSelectedValues,
  });

  factory Facet.fromJson(Map<String, dynamic> json) => Facet(
        id: json['id'] as String?,
        name: json['name'] as String?,
        facetValues: (json['facetValues'] as List<dynamic>?)
            ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
            .toList(),
        displayStyle: json['displayStyle'] as String?,
        facetType: json['facetType'] as String?,
        hasSelectedValues: json['hasSelectedValues'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'facetValues': facetValues?.map((e) => e.toJson()).toList(),
        'displayStyle': displayStyle,
        'facetType': facetType,
        'hasSelectedValues': hasSelectedValues,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      facetValues,
      displayStyle,
      facetType,
      hasSelectedValues,
    ];
  }
}

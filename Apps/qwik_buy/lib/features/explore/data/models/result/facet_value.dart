import 'package:equatable/equatable.dart';

class FacetValue extends Equatable {
  final int? count;
  final String? id;
  final String? name;
  final bool? isSelected;

  const FacetValue({this.count, this.id, this.name, this.isSelected});

  factory FacetValue.fromJson(Map<String, dynamic> json) => FacetValue(
        count: json['count'] as int?,
        id: json['id'] as String?,
        name: json['name'] as String?,
        isSelected: json['isSelected'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'id': id,
        'name': name,
        'isSelected': isSelected,
      };

  @override
  List<Object?> get props => [count, id, name, isSelected];
}

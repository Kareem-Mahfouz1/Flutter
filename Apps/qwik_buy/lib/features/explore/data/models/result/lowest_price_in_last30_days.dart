import 'package:equatable/equatable.dart';

class LowestPriceInLast30Days extends Equatable {
  final dynamic value;
  final String? text;

  const LowestPriceInLast30Days({this.value, this.text});

  factory LowestPriceInLast30Days.fromJson(Map<String, dynamic> json) {
    return LowestPriceInLast30Days(
      value: json['value'] as dynamic,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'text': text,
      };

  @override
  List<Object?> get props => [value, text];
}

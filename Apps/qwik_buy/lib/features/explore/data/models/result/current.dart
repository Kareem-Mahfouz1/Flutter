import 'package:equatable/equatable.dart';

class Current extends Equatable {
  final double? value;
  final String? text;

  const Current({this.value, this.text});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json['value'] as double?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'text': text,
      };

  @override
  List<Object?> get props => [value, text];
}

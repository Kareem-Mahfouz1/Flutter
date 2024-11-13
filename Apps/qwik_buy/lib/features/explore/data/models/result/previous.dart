import 'package:equatable/equatable.dart';

class Previous extends Equatable {
  final dynamic value;
  final String? text;

  const Previous({this.value, this.text});

  factory Previous.fromJson(Map<String, dynamic> json) => Previous(
        value: json['value'] as dynamic,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'text': text,
      };

  @override
  List<Object?> get props => [value, text];
}

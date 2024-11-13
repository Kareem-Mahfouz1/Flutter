import 'package:equatable/equatable.dart';

class Rrp extends Equatable {
  final dynamic value;
  final String? text;

  const Rrp({this.value, this.text});

  factory Rrp.fromJson(Map<String, dynamic> json) => Rrp(
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

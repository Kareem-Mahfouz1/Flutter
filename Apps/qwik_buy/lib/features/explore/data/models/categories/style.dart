import 'package:equatable/equatable.dart';

class Style extends Equatable {
  final String? webLargeStyleType;
  final String? mobileStyleType;

  const Style({this.webLargeStyleType, this.mobileStyleType});

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        webLargeStyleType: json['webLargeStyleType'] as String?,
        mobileStyleType: json['mobileStyleType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'webLargeStyleType': webLargeStyleType,
        'mobileStyleType': mobileStyleType,
      };

  @override
  List<Object?> get props => [webLargeStyleType, mobileStyleType];
}

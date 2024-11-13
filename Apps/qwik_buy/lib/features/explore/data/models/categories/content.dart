import 'package:equatable/equatable.dart';

class Content extends Equatable {
  final String? title;
  final dynamic subTitle;
  final dynamic webLargeImageUrl;
  final dynamic mobileImageUrl;

  const Content({
    this.title,
    this.subTitle,
    this.webLargeImageUrl,
    this.mobileImageUrl,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json['title'] as String?,
        subTitle: json['subTitle'] as dynamic,
        webLargeImageUrl: json['webLargeImageUrl'] as dynamic,
        mobileImageUrl: json['mobileImageUrl'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'subTitle': subTitle,
        'webLargeImageUrl': webLargeImageUrl,
        'mobileImageUrl': mobileImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      title,
      subTitle,
      webLargeImageUrl,
      mobileImageUrl,
    ];
  }
}

import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final String? linkType;
  final dynamic brandSectionAlias;
  final int? categoryId;
  final String? webUrl;
  final String? appUrl;

  const Link({
    this.linkType,
    this.brandSectionAlias,
    this.categoryId,
    this.webUrl,
    this.appUrl,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        linkType: json['linkType'] as String?,
        brandSectionAlias: json['brandSectionAlias'] as dynamic,
        categoryId: json['categoryId'] as int?,
        webUrl: json['webUrl'] as String?,
        appUrl: json['appUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'linkType': linkType,
        'brandSectionAlias': brandSectionAlias,
        'categoryId': categoryId,
        'webUrl': webUrl,
        'appUrl': appUrl,
      };

  @override
  List<Object?> get props {
    return [
      linkType,
      brandSectionAlias,
      categoryId,
      webUrl,
      appUrl,
    ];
  }
}

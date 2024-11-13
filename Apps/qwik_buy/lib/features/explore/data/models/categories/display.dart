import 'package:equatable/equatable.dart';

class Display extends Equatable {
  final int? webLargeTemplateId;
  final String? webLargeTemplateName;
  final int? webLargeColumnSpan;
  final int? mobileTemplateId;
  final String? mobileTemplateName;
  final String? mobileDisplayLayout;

  const Display({
    this.webLargeTemplateId,
    this.webLargeTemplateName,
    this.webLargeColumnSpan,
    this.mobileTemplateId,
    this.mobileTemplateName,
    this.mobileDisplayLayout,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        webLargeTemplateId: json['webLargeTemplateId'] as int?,
        webLargeTemplateName: json['webLargeTemplateName'] as String?,
        webLargeColumnSpan: json['webLargeColumnSpan'] as int?,
        mobileTemplateId: json['mobileTemplateId'] as int?,
        mobileTemplateName: json['mobileTemplateName'] as String?,
        mobileDisplayLayout: json['mobileDisplayLayout'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'webLargeTemplateId': webLargeTemplateId,
        'webLargeTemplateName': webLargeTemplateName,
        'webLargeColumnSpan': webLargeColumnSpan,
        'mobileTemplateId': mobileTemplateId,
        'mobileTemplateName': mobileTemplateName,
        'mobileDisplayLayout': mobileDisplayLayout,
      };

  @override
  List<Object?> get props {
    return [
      webLargeTemplateId,
      webLargeTemplateName,
      webLargeColumnSpan,
      mobileTemplateId,
      mobileTemplateName,
      mobileDisplayLayout,
    ];
  }
}

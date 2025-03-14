import 'package:equatable/equatable.dart';

import 'child.dart';
import 'content.dart';
import 'display.dart';
import 'style.dart';
import 'link.dart';

class Brand extends Equatable {
  final String? id;
  final String? alias;
  final String? type;
  final List<dynamic>? channelExclusions;
  final int? webLargePriority;
  final Content? content;
  final Display? display;
  final Style? style;
  final Link? link;
  final List<Child>? children;

  const Brand({
    this.id,
    this.alias,
    this.type,
    this.channelExclusions,
    this.webLargePriority,
    this.content,
    this.display,
    this.style,
    this.link,
    this.children,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json['id'] as String?,
        alias: json['alias'] as String?,
        type: json['type'] as String?,
        channelExclusions: json['channelExclusions'] as List<dynamic>?,
        webLargePriority: json['webLargePriority'] as int?,
        content: json['content'] == null
            ? null
            : Content.fromJson(json['content'] as Map<String, dynamic>),
        display: json['display'] == null
            ? null
            : Display.fromJson(json['display'] as Map<String, dynamic>),
        style: json['style'] == null
            ? null
            : Style.fromJson(json['style'] as Map<String, dynamic>),
        link: json['link'] == null
            ? null
            : Link.fromJson(json['link'] as Map<String, dynamic>),
        children: (json['children'] as List<dynamic>?)
            ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'alias': alias,
        'type': type,
        'channelExclusions': channelExclusions,
        'webLargePriority': webLargePriority,
        'content': content?.toJson(),
        'display': display?.toJson(),
        'style': style?.toJson(),
        'link': link,
        'children': children?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      alias,
      type,
      channelExclusions,
      webLargePriority,
      content,
      display,
      style,
      link,
      children,
    ];
  }
}

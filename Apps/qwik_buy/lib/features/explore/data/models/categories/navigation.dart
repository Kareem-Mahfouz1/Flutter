import 'package:equatable/equatable.dart';

import 'child.dart';
import 'content.dart';
import 'link.dart';
import 'style.dart';

class Navigation extends Equatable {
  final String? id;
  final String? alias;
  final String? type;
  final List<dynamic>? channelExclusions;
  final int? webLargePriority;
  final Content? content;
  final dynamic display;
  final Style? style;
  final Link? link;
  final List<Child>? children;

  const Navigation({
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

  factory Navigation.fromJson(Map<String, dynamic> json) => Navigation(
        id: json['id'] as String?,
        alias: json['alias'] as String?,
        type: json['type'] as String?,
        channelExclusions: json['channelExclusions'] as List<dynamic>?,
        webLargePriority: json['webLargePriority'] as int?,
        content: json['content'] == null
            ? null
            : Content.fromJson(json['content'] as Map<String, dynamic>),
        display: json['display'] as dynamic,
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
        'display': display,
        'style': style?.toJson(),
        'link': link?.toJson(),
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

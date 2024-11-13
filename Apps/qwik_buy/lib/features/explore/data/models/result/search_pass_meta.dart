import 'package:equatable/equatable.dart';

class SearchPassMeta extends Equatable {
  final bool? isPartial;
  final bool? isSpellcheck;
  final List<dynamic>? searchPass;
  final List<dynamic>? alternateSearchTerms;

  const SearchPassMeta({
    this.isPartial,
    this.isSpellcheck,
    this.searchPass,
    this.alternateSearchTerms,
  });

  factory SearchPassMeta.fromJson(Map<String, dynamic> json) {
    return SearchPassMeta(
      isPartial: json['isPartial'] as bool?,
      isSpellcheck: json['isSpellcheck'] as bool?,
      searchPass: json['searchPass'] as List<dynamic>?,
      alternateSearchTerms: json['alternateSearchTerms'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'isPartial': isPartial,
        'isSpellcheck': isSpellcheck,
        'searchPass': searchPass,
        'alternateSearchTerms': alternateSearchTerms,
      };

  @override
  List<Object?> get props {
    return [
      isPartial,
      isSpellcheck,
      searchPass,
      alternateSearchTerms,
    ];
  }
}

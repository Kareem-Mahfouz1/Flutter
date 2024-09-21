class Sys {
  late String pod;

  Sys({
    required this.pod,
  });

  Sys.fromMap(Map<String, dynamic> map) {
    pod = map['pod'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'pod': pod,
    };
    return map;
  }
}

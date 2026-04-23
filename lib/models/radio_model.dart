class RadiosModel {
  final List<RadioStation> radios;

  RadiosModel({required this.radios});

  factory RadiosModel.fromJson(Map<String, dynamic> json) {
    return RadiosModel(
      radios:
          (json['radios'] as List<dynamic>?)
              ?.map((e) => RadioStation.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'radios': radios.map((e) => e.toJson()).toList()};
  }
}

class RadioStation {
  final int id;
  final String name;
  final String url;

  RadioStation({required this.id, required this.name, required this.url});

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'url': url};
  }
}

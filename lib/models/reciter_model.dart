class RecitersModel {
  final List<Reciter> reciters;

  RecitersModel({required this.reciters});

  factory RecitersModel.fromJson(Map<String, dynamic> json) {
    return RecitersModel(
      reciters:
          (json['reciters'] as List<dynamic>?)
              ?.map((e) => Reciter.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'reciters': reciters.map((e) => e.toJson()).toList()};
  }
}

class Reciter {
  final int id;
  final String name;
  final List<Moshaf> moshaf;

  Reciter({required this.id, required this.name, required this.moshaf});

  factory Reciter.fromJson(Map<String, dynamic> json) {
    return Reciter(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      moshaf:
          (json['moshaf'] as List<dynamic>?)
              ?.map((e) => Moshaf.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'moshaf': moshaf.map((e) => e.toJson()).toList(),
    };
  }
}

class Moshaf {
  final int id;
  final String name;
  final String server;
  final int surahTotal;
  final String surahList;

  Moshaf({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return Moshaf(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      server: json['server'] ?? '',
      surahTotal: json['surah_total'] ?? 0,
      surahList: json['surah_list'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'server': server,
      'surah_total': surahTotal,
      'surah_list': surahList,
    };
  }

  String getAudioUrl(int surahNumber) {
    final padded = surahNumber.toString().padLeft(3, '0');
    return '$server$padded.mp3';
  }
}

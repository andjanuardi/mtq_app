// model_kabupaten.dart

class ModelKabupaten {
  final String id;
  final String nama;
  final String ibuKota;
  final String pimpinan;
  final String logo;

  ModelKabupaten({
    required this.id,
    required this.nama,
    required this.ibuKota,
    required this.pimpinan,
    required this.logo,
  });

  factory ModelKabupaten.fromJson(Map<String, dynamic> json) {
    return ModelKabupaten(
      id: json['id'],
      nama: json['nama'],
      ibuKota: json['ibu_kota'],
      pimpinan: json['pimpinan'],
      logo: json['logo'],
    );
  }
}

// model_kabupaten.dart

class DataJadwal {
  final String id;
  final String waktuMulai;
  final String waktuSelesai;
  final String lokasi;
  final String kegiatan;
  final String keterangan;

  DataJadwal({
    required this.id,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.lokasi,
    required this.kegiatan,
    required this.keterangan,
  });

  factory DataJadwal.fromJson(Map<String, dynamic> json) {
    return DataJadwal(
      id: json['id'],
      waktuMulai: json['waktuMulai'],
      waktuSelesai: json['waktuSelesai'],
      lokasi: json['lokasi'],
      kegiatan: json['kegiatan'],
      keterangan: json['keterangan'],
    );
  }

  static List<DataJadwal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DataJadwal.fromJson(json)).toList();
  }
}

List<Map<String, dynamic>> jsonJadwal = [
  {
    "id": 0,
    "waktuMulai": DateTime(2023, 11, 23, 08, 00),
    "waktuSelesai": DateTime(2023, 11, 24, 23, 00),
    'lokasi': 'Sekretariat',
    'kegiatan': 'Penerimaan Kafilah',
    'keterangan': 'Seluruh Kafilah'
  },
  {
    "id": 1,
    "waktuMulai": DateTime(2023, 11, 25, 10, 00),
    "waktuSelesai": DateTime(2023, 11, 25, 11, 00),
    'lokasi': 'Sekretariat',
    'kegiatan': 'Verifikasi Faktual Peserta',
    'keterangan':
        'Kafilah Simeulue, Subulussalam, Aceh Singkil, Aceh Jaya, Abdya, dan Aceh Selatan'
  }
];

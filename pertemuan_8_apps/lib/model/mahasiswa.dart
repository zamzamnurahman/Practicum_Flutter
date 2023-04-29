class Mahasiswa {
  String nama;
  String nim;

  Mahasiswa(this.nama, this.nim);

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(json['name']!, json['nim']!);
  }
}

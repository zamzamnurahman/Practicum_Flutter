import 'package:pertemuan_8_apps/data/data_mahasiswa.dart';
import 'package:pertemuan_8_apps/model/mahasiswa.dart';

class ServicesDataMahasiswa {
  Future<List<Mahasiswa>> getDataMahasiswa() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Mahasiswa> result =
        daftarMahasiswa.map((e) => Mahasiswa.fromJson(e)).toList();
    return result;
  }
}

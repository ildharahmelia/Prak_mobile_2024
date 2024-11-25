import 'Karyawan.dart';

class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  final int maxKaryawanAktif = 20;

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < maxKaryawanAktif) {
      karyawanAktif.add(karyawan);
      print("Karyawan ${karyawan.nama} ditambahkan sebagai karyawan aktif dengan peran ${karyawan.peran}.");
    } else {
      print("Kapasitas maksimal karyawan aktif tercapai.");
    }
  }

  void resignKaryawan(Karyawan karyawan) {
    karyawanAktif.remove(karyawan);
    karyawanNonAktif.add(karyawan);
    print("Karyawan ${karyawan.nama} telah resign dan menjadi non-aktif.");
  }
}

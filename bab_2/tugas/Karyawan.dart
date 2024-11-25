abstract class Karyawan with Kinerja {
  String nama;
  int umur;
  String peran;

  Karyawan(this.nama, {required this.umur, required this.peran});

  void bekerja();

  // Aturan produktivitas Manager
  void cekProduktivitas() {
    if (peran == "Manager" && produktivitas < 85) {
      print("Produktivitas kurang dari 85, ${nama} tidak boleh menjadi Manager!");
    } else {
      print("Produktivitas ${nama} sebagai ${peran} : ${produktivitas}");
    }
  }
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, {required int umur, required String peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("$nama bekerja selama hari kerja reguler sebagai $peran.");
  }
}

class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String nama, {required int umur, required String peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("$nama bekerja pada proyek tertentu sebagai $peran.");
  }
}

mixin Kinerja {
  int produktivitas = 0;

  void perbaruiProduktivitas(int nilai, int hariSetelahUpdateTerakhir) {
    if (hariSetelahUpdateTerakhir >= 30) {
      produktivitas = (produktivitas + nilai).clamp(0, 100);
    }
  }
}
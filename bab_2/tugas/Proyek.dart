import 'enums.dart';
import 'Karyawan.dart';

// Kelas Proyek untuk manajemen fase proyek
class Proyek {
  FaseProyek fase = FaseProyek.Perencanaan;
  int durasiHari;
  List<Karyawan> timKaryawan = [];

  Proyek(this.durasiHari);

  // Metode untuk beralih fase
  void alihkanFase() {
    if (fase == FaseProyek.Perencanaan && timKaryawan.length >= 5) {
      fase = FaseProyek.Pengembangan;
      print("Proyek beralih ke fase Pengembangan.");
    } else if (fase == FaseProyek.Pengembangan && durasiHari > 45) {
      fase = FaseProyek.Evaluasi;
      print("Proyek beralih ke fase Evaluasi.");
    } else {
      print("Belum memenuhi syarat untuk alih fase.");
    }
  }
}
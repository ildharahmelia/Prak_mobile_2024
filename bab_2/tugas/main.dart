import 'enums.dart';
import 'ProdukDigital.dart';
import 'Karyawan.dart';
import 'Perusahaan.dart';
import 'Proyek.dart';

void main() {

  ProdukDigital produk1 = ProdukDigital("Sistem Manajemen Data", 150000, Kategori.DataManagement, 10);
  ProdukDigital produk2 = ProdukDigital("Sistem Otomasi Jaringan", 250000, Kategori.NetworkAutomation, 55);

  produk1.terapkanDiskon();
  produk2.terapkanDiskon();

  KaryawanTetap karyawanTetap = KaryawanTetap("Asil", umur: 25, peran: "Developer");
  KaryawanKontrak karyawanKontrak = KaryawanKontrak("Usamah", umur: 24, peran: "NetworkEngineer");

  KaryawanTetap manager = KaryawanTetap("Alif", umur: 23, peran: "Manager");
  manager.perbaruiProduktivitas(90, 30);
  manager.cekProduktivitas();

  Perusahaan tongIT = Perusahaan();
  tongIT.tambahKaryawan(manager);
  tongIT.tambahKaryawan(karyawanTetap);
  tongIT.tambahKaryawan(karyawanKontrak);

  Proyek proyek1 = Proyek(50);
  proyek1.timKaryawan = [manager, karyawanTetap, karyawanKontrak];
  proyek1.alihkanFase();

  tongIT.resignKaryawan(karyawanTetap);
}

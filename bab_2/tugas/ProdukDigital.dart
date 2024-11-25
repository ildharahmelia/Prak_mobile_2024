import 'enums.dart';

class ProdukDigital {
  String namaProduk;
  double harga;
  Kategori kategori;
  int jumlahTerjual;

  ProdukDigital(this.namaProduk, this.harga, this.kategori, this.jumlahTerjual);

  void terapkanDiskon() {
    if (kategori == Kategori.NetworkAutomation && jumlahTerjual > 50) {
      double hargaAwal = harga;
      double diskonHarga = harga * 0.85;
      harga = diskonHarga >= 200000 ? diskonHarga : 200000;
      print("Diskon diterapkan pada $namaProduk, harga awal: $hargaAwal, harga sekarang: $harga");
    } else {
      print("Diskon tidak dapat diterapkan pada produk $namaProduk.");}
  }
}
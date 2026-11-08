import 'package:flutter/foundation.dart';

class Laporan {
  Laporan({required this.nama, required this.email, required this.kategori,
    required this.deskripsi, this.selesai = false});
  final String nama, email, kategori, deskripsi;
  bool selesai;
}

class LaporanModel extends ChangeNotifier {
  final List<Laporan> _laporan = [];
  List<Laporan> get laporan => List.unmodifiable(_laporan);
  void tambah(Laporan item) { _laporan.add(item); notifyListeners(); }
  void tandaiSelesai(int i) {
    if (i >= 0 && i < _laporan.length) { _laporan[i].selesai = true; notifyListeners(); }
  }
  Map<String, int> get jumlahPerKategori {
    final hasil = <String,int>{'Pencurian':0,'Gangguan Keamanan':0,'Kekerasan':0};
    for (final l in _laporan) { hasil[l.kategori] = (hasil[l.kategori] ?? 0) + 1; }
    return hasil;
  }
}

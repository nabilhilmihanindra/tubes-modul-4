import 'package:flutter/material.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_form_laporan.dart';
import '../pages/halaman_riwayat.dart';
import '../pages/halaman_statistik.dart';
import 'app_routes.dart';

class KerangkaNavigasi {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.beranda: (_) => const HalamanBeranda(),
    AppRoutes.buatLaporan: (_) => const HalamanFormLaporan(),
    AppRoutes.riwayat: (_) => const HalamanRiwayat(),
    AppRoutes.statistik: (_) => const HalamanStatistik(),
  };
}

import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';
class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Sahabat Warga')),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => Navigator.pushNamed(context, AppRoutes.buatLaporan),
      icon: const Icon(Icons.add), label: const Text('Buat Laporan')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Pelaporan Kriminalitas Kota Palembang', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Laporkan kejadian dan pantau tindak lanjut laporan melalui aplikasi Sahabat Warga.'),
      const SizedBox(height: 20),
      ListTile(leading: const Icon(Icons.history), title: const Text('Riwayat Laporan'), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.pushNamed(context, AppRoutes.riwayat)),
      ListTile(leading: const Icon(Icons.bar_chart), title: const Text('Statistik Laporan'), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.pushNamed(context, AppRoutes.statistik)),
    ]),
  );
}

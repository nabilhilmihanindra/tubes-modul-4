import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/laporan_model.dart';

class HalamanRiwayat extends StatelessWidget {
  const HalamanRiwayat({super.key});
  @override
  Widget build(BuildContext context) {
    final data = context.watch<LaporanModel>().laporan;
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: data.isEmpty ? const Center(child: Text('Belum ada laporan.')) : ListView.builder(
        padding: const EdgeInsets.all(12), itemCount: data.length,
        itemBuilder: (_, i) {
          final l = data[i];
          return GestureDetector(
            onTap: () => showDialog(context: context, builder: (_) => AlertDialog(
              title: Text(l.kategori), content: Text('${l.nama}\n${l.email}\n\n${l.deskripsi}'),
              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))])),
            onLongPress: () => context.read<LaporanModel>().tandaiSelesai(i),
            child: Card(child: ListTile(
              title: Text(l.kategori), subtitle: Text(l.deskripsi, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: Icon(l.selesai ? Icons.check_circle : Icons.pending, color: l.selesai ? Colors.green : Colors.orange),
            )),
          );
        },
      ),
    );
  }
}

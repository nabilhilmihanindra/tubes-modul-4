import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/laporan_model.dart';

class HalamanFormLaporan extends StatefulWidget {
  const HalamanFormLaporan({super.key});
  @override
  State<HalamanFormLaporan> createState() => _HalamanFormLaporanState();
}
class _HalamanFormLaporanState extends State<HalamanFormLaporan> {
  final nama = TextEditingController();
  final email = TextEditingController();
  final deskripsi = TextEditingController();
  String kategori = 'Pencurian';
  bool setuju = false, loading = false;
  bool get valid => nama.text.trim().isNotEmpty && email.text.contains('@') && deskripsi.text.trim().isNotEmpty && setuju;
  @override
  void dispose() { nama.dispose(); email.dispose(); deskripsi.dispose(); super.dispose(); }
  Future<void> simpan() async {
    setState(() => loading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    context.read<LaporanModel>().tambah(Laporan(
      nama: nama.text.trim(), email: email.text.trim(), kategori: kategori, deskripsi: deskripsi.text.trim()));
    setState(() => loading = false);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Buat Laporan')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      TextField(controller: nama, decoration: const InputDecoration(labelText: 'Nama pelapor', border: OutlineInputBorder()), onChanged: (_) => setState(() {})),
      const SizedBox(height: 12),
      TextField(controller: email, decoration: const InputDecoration(labelText: 'Email', helperText: 'Gunakan email yang mengandung @', border: OutlineInputBorder()), onChanged: (_) => setState(() {})),
      const SizedBox(height: 12),
      DropdownButtonFormField<String>(value: kategori, decoration: const InputDecoration(labelText: 'Kategori kriminalitas', border: OutlineInputBorder()),
        items: ['Pencurian','Gangguan Keamanan','Kekerasan'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (v) => setState(() => kategori = v ?? kategori)),
      const SizedBox(height: 12),
      TextField(controller: deskripsi, maxLines: 4, decoration: const InputDecoration(labelText: 'Deskripsi kejadian', border: OutlineInputBorder()), onChanged: (_) => setState(() {})),
      CheckboxListTile(value: setuju, onChanged: (v) => setState(() => setuju = v ?? false), title: const Text('Saya menyatakan laporan ini benar dan menyetujui penggunaan data')),
      ElevatedButton.icon(onPressed: valid && !loading ? simpan : null,
        icon: loading ? const SizedBox(width: 18,height: 18,child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
        label: Text(loading ? 'Mengirim...' : 'Kirim Laporan')),
    ]),
  );
}

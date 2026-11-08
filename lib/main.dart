import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/laporan_model.dart';
import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (_) => LaporanModel(),
  child: const SahabatWargaApp(),
));

class SahabatWargaApp extends StatelessWidget {
  const SahabatWargaApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Sahabat Warga',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B136E)), useMaterial3: true),
    initialRoute: AppRoutes.beranda,
    routes: KerangkaNavigasi.routes,
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/laporan_model.dart';

class HalamanStatistik extends StatelessWidget {
  const HalamanStatistik({super.key});
  @override
  Widget build(BuildContext context) {
    final data = context.watch<LaporanModel>().jumlahPerKategori;
    final labels = data.keys.toList(), values = data.values.toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Statistik Kriminalitas')),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Jumlah Laporan per Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(child: BarChart(BarChartData(
            maxY: (values.fold<int>(0,(a,b)=>a>b?a:b)+2).toDouble(),
            barGroups: List.generate(labels.length, (i) => BarChartGroupData(x:i, barRods:[BarChartRodData(toY: values[i].toDouble(), width: 30, borderRadius: BorderRadius.circular(4))])),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles:false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles:false)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles:true, getTitlesWidget:(v,_) {
                final i=v.toInt(); return Padding(padding: const EdgeInsets.only(top:8), child: Text(i>=0&&i<labels.length?labels[i].split(' ').first:'', style: const TextStyle(fontSize:10)));
              })),
            ),
            borderData: FlBorderData(show:false),
          ))),
        ],
      )),
    );
  }
}

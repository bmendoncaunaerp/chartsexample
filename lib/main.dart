import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  var atletas = [
    Atleta("Bruno", [2, 4, 5, 3, 5, 2, 3]),
    Atleta("João", [3, 5, 2, 3, 4, 1, 4]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Charts"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: 30,
            minX: 0,
            maxX: 15,
            titlesData: FlTitlesData(
              topTitles:AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(axisNameWidget: Text("Voltas"), sideTitles: SideTitles(showTitles: true))
            ),
            lineBarsData: atletas.map((e) => LineChartBarData(
                spots: e.tempos.asMap().entries.map((entry) => FlSpot(entry.key.toDouble(), entry.value)).toList()
            )).toList()
          )
        ),
      ),
    );
  }
}

class Atleta {
  String nome;
  List<double> tempos;

  Atleta(this.nome, this.tempos);
}

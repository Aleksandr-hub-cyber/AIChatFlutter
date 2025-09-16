import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/provider_settings_page.dart';
import 'pages/token_stats_page.dart';
import 'pages/spending_chart_page.dart';

void main() {
  runApp(AIChatApp());
}

class AIChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIChatFlutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => ProviderSettingsPage(),
        '/tokens': (context) => TokenStatsPage(),
        '/spending': (context) => SpendingChartPage(),
      },
    );
  }
}

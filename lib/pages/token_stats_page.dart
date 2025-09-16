import 'package:flutter/material.dart';

class TokenStatsPage extends StatelessWidget {
  // Demo data: token usage per model
  final Map<String, int> tokenUsage = {
    'gpt-4': 12450,
    'gpt-3.5': 8760,
    'mistral': 4320,
  };

  TokenStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = tokenUsage.entries.toList();
    return Scaffold(
      appBar: AppBar(title: Text('Статистика токенов')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_,__) => Divider(),
          itemBuilder: (context, index) {
            final e = items[index];
            return ListTile(
              title: Text(e.key),
              subtitle: Text('Использовано токенов: ${e.value}'),
              trailing: Text('${(e.value/1000).toStringAsFixed(1)}k'),
            );
          },
        ),
      ),
    );
  }
}

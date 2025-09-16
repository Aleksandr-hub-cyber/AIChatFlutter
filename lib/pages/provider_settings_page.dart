import 'package:flutter/material.dart';

class ProviderSettingsPage extends StatefulWidget {
  const ProviderSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProviderSettingsPage> createState() => _ProviderSettingsPageState();
}

class _ProviderSettingsPageState extends State<ProviderSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  String _provider = 'openRouter';
  final _openRouterKeyCtrl = TextEditingController();
  final _vsegptKeyCtrl = TextEditingController();

  @override
  void dispose() {
    _openRouterKeyCtrl.dispose();
    _vsegptKeyCtrl.dispose();
    super.dispose();
  }

  void _saveSettings() {
    if (_formKey.currentState!.validate()) {
      // For demo: store to local state. In production, persist via secure storage.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Настройки сохранены (прототип)')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Настройки провайдера')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _provider,
                  items: [
                    DropdownMenuItem(value: 'openRouter', child: Text('openRouter')),
                    DropdownMenuItem(value: 'VSEGPT', child: Text('VSEGPT')),
                  ],
                  onChanged: (v) => setState(() => _provider = v ?? 'openRouter'),
                  decoration: InputDecoration(labelText: 'Провайдер'),
                ),
                TextFormField(
                  controller: _openRouterKeyCtrl,
                  decoration: InputDecoration(labelText: 'API ключ openRouter'),
                  validator: (v) => null,
                ),
                TextFormField(
                  controller: _vsegptKeyCtrl,
                  decoration: InputDecoration(labelText: 'API ключ VSEGPT'),
                  validator: (v) => null,
                ),
                SizedBox(height: 16),
                ElevatedButton(onPressed: _saveSettings, child: Text('Сохранить')),
              ],
            ),
          ),
        ));
  }
}

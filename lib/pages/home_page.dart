import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildMenuButton(BuildContext context, String title, String route) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AIChatFlutter — Главная'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text('Меню', style: TextStyle(color: Colors.white, fontSize: 24)), decoration: BoxDecoration(color: Colors.indigo)),
            ListTile(
              title: Text('Настройки провайдера'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            ListTile(
              title: Text('Статистика токенов'),
              onTap: () => Navigator.pushNamed(context, '/tokens'),
            ),
            ListTile(
              title: Text('График расходов'),
              onTap: () => Navigator.pushNamed(context, '/spending'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Добро пожаловать в AIChatFlutter', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            _buildMenuButton(context, 'Настройки провайдера', '/settings'),
            SizedBox(height: 8),
            _buildMenuButton(context, 'Статистика токенов', '/tokens'),
            SizedBox(height: 8),
            _buildMenuButton(context, 'График расходов', '/spending'),
          ],
        ),
      ),
    );
  }
}

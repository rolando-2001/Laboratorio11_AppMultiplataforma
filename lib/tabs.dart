import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Comparación de Barras de Pestañas'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Material'),
              Tab(text: 'Cupertino'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MaterialTabsExample(),
            CupertinoTabsExample(),
          ],
        ),
      ),
    );
  }
}

class MaterialTabsExample extends StatelessWidget {
  const MaterialTabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pestañas Material'),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          Center(child: Text('Pestaña de Coche')),
          Center(child: Text('Pestaña de Tránsito')),
        ],
      ),
    );
  }
}

class CupertinoTabsExample extends StatelessWidget {
  const CupertinoTabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.car),
            label: 'Coche',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bus),
            label: 'Tránsito',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return const Center(child: Text('Pestaña de Coche'));
              case 1:
                return const Center(child: Text('Pestaña de Tránsito'));
              default:
                return const Center(child: Text('Pestaña Desconocida'));
            }
          },
        );
      },
    );
  }
}
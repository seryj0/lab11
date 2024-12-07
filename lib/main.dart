import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_config.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContainerConfig(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Configurator'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: config.width,
                height: config.height,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(config.borderRadius),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConfiguratorSection(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ConfiguratorSection extends StatelessWidget {
  const ConfiguratorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Width', style: TextStyle(fontSize: 16)),
              Text(config.width.toStringAsFixed(1), style: const TextStyle(fontSize: 16)),
            ],
          ),
          Slider(
            value: config.width,
            min: 50,
            max: 300,
            onChanged: (value) => config.setWidth(value),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Height', style: TextStyle(fontSize: 16)),
              Text(config.height.toStringAsFixed(1), style: const TextStyle(fontSize: 16)),
            ],
          ),
          Slider(
            value: config.height,
            min: 50,
            max: 300,
            onChanged: (value) => config.setHeight(value),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Border Radius', style: TextStyle(fontSize: 16)),
              Text(config.borderRadius.toStringAsFixed(1), style: const TextStyle(fontSize: 16)),
            ],
          ),
          Slider(
            value: config.borderRadius,
            min: 0,
            max: 100,
            onChanged: (value) => config.setBorderRadius(value),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DataPassingNavigatorPage extends StatelessWidget {
  const DataPassingNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('値渡し_Navigator')
        ),
        body: Column()
    );
  }
}

import 'package:flutter/material.dart';

class DataPassingRiverpodPage extends StatelessWidget {
  const DataPassingRiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('値渡し_Riverpod')
        ),
        body: Column()
    );
  }
}

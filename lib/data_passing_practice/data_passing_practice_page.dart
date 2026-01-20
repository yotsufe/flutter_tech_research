import 'package:flutter/material.dart';
import 'package:flutter_tech_research/data_passing_practice/riverpod/data_passing_riverpod.dart';

import 'navigator/data_passing_navigator.dart';

class DataPassingPracticePage extends StatelessWidget {
  const DataPassingPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonStyle = OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('値渡し')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              OutlinedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DataPassingNavigatorPage()),
                  );
                },
                child: const Text('値渡し_Navigator'),
              ),

              const SizedBox(height: 20),

              OutlinedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DataPassingRiverpodPage()),
                  );
                },
                child: const Text('値渡し_Riverpod'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

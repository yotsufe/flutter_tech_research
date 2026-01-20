import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'riverpod_practice_view_model.dart';

class RiverpodPracticePage extends ConsumerWidget {
  const RiverpodPracticePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(riverpodPracticeProvider);
    final notifier = ref.read(riverpodPracticeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: Column(
        children: [
          Expanded(
            child: _buildBody(state),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                notifier.fetchPosts();
              },
              child: const Text('10件取得する'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(RiverpodPracticeState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 50),
            const SizedBox(height: 10),
            Text(
              state.errorMessage!,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (state.titles.isEmpty) {
      return const Center(child: Text('データを取得してください'));
    }

    return ListView.builder(
      itemCount: state.titles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(state.titles[index]),
          ),
        );
      },
    );
  }
}

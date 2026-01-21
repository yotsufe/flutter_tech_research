import 'package:flutter/material.dart';

class DataPassingNavigatorPage extends StatefulWidget {
  const DataPassingNavigatorPage({super.key});

  @override
  State<DataPassingNavigatorPage> createState() => _DataPassingNavigatorPageState();
}

class _DataPassingNavigatorPageState extends State<DataPassingNavigatorPage> {
  String _orderResult = 'まだ注文されていません';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('値渡し_Navigator1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text('注文内容:', style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 8),

            Text(
              _orderResult,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 28),

            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const _CourseSelectPage()),
                );

                if (result != null && mounted) {
                  setState(() {
                    _orderResult = result;
                  });
                }
              },
              child: const Text('注文を始める'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseSelectPage extends StatelessWidget {
  const _CourseSelectPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('値渡し_Navigator2')
      ),
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text('コースを選んでください'),

            const SizedBox(height: 20),

            _buildCourseBtn(context, 'ランチコース'),

            const SizedBox(height: 20),

            _buildCourseBtn(context, 'ディナーコース'),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseBtn(BuildContext context, String courseName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _MenuSelectPage(selectedCourse: courseName),
          ),
        );

        if (result != null && context.mounted) {
          Navigator.pop(context, result);
        }
      },
      child: Text(courseName),
    );
  }
}

class _MenuSelectPage extends StatelessWidget {
  final String selectedCourse;

  const _MenuSelectPage({required this.selectedCourse});

  static const Map<String, List<String>> menuData = {
    'ランチコース': [
      'ハンバーグランチ',
      '週替わりパスタ',
      'ミックスフライ定食',
    ],
    'ディナーコース': [
      '国産牛サーロインステーキ',
      'オマール海老のポワレ',
      'シェフのおまかせフルコース',
      'キャビアとトリュフのリゾット',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final List<String> currentMenuList = menuData[selectedCourse] ?? [];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('値渡し_Navigator3')
      ),
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Text(
                '「$selectedCourse」\nのメニュー表',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 28),

              for (final menuName in currentMenuList) ...[
                _buildMenuBtn(context, menuName),
                const SizedBox(height: 16),
              ],

              if (currentMenuList.isEmpty)
                const Text('メニューが見つかりませんでした'),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBtn(BuildContext context, String menuName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(240, 50)),
      onPressed: () {
        final finalOrder = '$selectedCourse\nの\n$menuName';
        Navigator.pop(context, finalOrder);
      },
      child: Text(menuName),
    );
  }
}

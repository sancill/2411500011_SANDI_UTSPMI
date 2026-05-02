import 'package:flutter/material.dart';
import 'DetailPage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Requirement 3: Data dummy
  final List<String> _activities = [
    'Belajar Flutter',
    'Olahraga Pagi',
    'Membaca Buku',
    'Mengerjakan UTS',
    'Coding Challenge',
  ];

  void _addActivity(String name) {
    if (name.isNotEmpty) {
      setState(() {
        _activities.add(name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Menangkap argumen yang dikirim dari LoginPage
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String username = args?['username'] ?? 'User';

    // Menggunakan MediaQuery untuk responsivitas
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daftar Aktivitas:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Requirement 3: ListView dengan Card
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(_activities[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Requirement 5: Navigasi ke Detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(activityName: _activities[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Requirement 4: Tombol Tambah (+)
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<String>(
            context: context,
            builder: (context) => const AddActivityDialog(),
          );
          if (result != null) {
            _addActivity(result);
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// Requirement 4: Form Sederhana (Dialog)
class AddActivityDialog extends StatefulWidget {
  const AddActivityDialog({super.key});

  @override
  State<AddActivityDialog> createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Aktivitas'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'Nama Aktivitas'),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}

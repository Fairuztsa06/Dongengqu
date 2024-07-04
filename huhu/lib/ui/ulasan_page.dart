import 'package:flutter/material.dart';

class UlasanPage extends StatefulWidget {
  const UlasanPage({super.key});

  @override
  _UlasanPageState createState() => _UlasanPageState();
}

class _UlasanPageState extends State<UlasanPage> {
  final TextEditingController _ulasanController = TextEditingController();

  void _submitUlasan() {
    // Simpan ulasan ke database atau tempat penyimpanan lainnya
    String ulasan = _ulasanController.text;
    // Lakukan sesuatu dengan ulasan, misalnya kirim ke server atau simpan lokal
    // Di sini bisa tambahkan logika penyimpanan ulasan
    print("Ulasan: $ulasan");

    // Kembali ke halaman sebelumnya setelah menyimpan ulasan
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ulasan"),
        backgroundColor: const Color.fromARGB(255, 199, 167, 167),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ulasanController,
              decoration: const InputDecoration(
                labelText: "Tulis ulasan Anda",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitUlasan,
              child: const Text("Kirim Ulasan"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ulasanController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import '../model/dongeng.dart';
import 'dongeng_detail.dart';

class DongengItem extends StatelessWidget {
  final Dongeng dongeng;
  final VoidCallback onTap;

  const DongengItem({
    Key? key,
    required this.dongeng,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('URL gambar: ${dongeng.gambar}'); // Tambahkan ini untuk debugging

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: dongeng.gambar!.isNotEmpty
          ? Image.network(
              dongeng.gambar!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          : Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: const Icon(
                Icons.image,
                color: Colors.white,
              ),
            ),
      title: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 230, 185, 202), // Warna latar belakang kotak
          borderRadius: BorderRadius.circular(8.0), // Bentuk border kotak
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dongeng.judul,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              "Penulis: ${dongeng.penulis}",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
            Text(
              "Tahun Terbit: ${dongeng.tahunTerbit}",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import '../service/dongeng_service.dart'; // Mengganti import dari poli_service.dart menjadi dongeng_service.dart
import 'dongeng_page.dart'; // Mengganti poli_page.dart menjadi dongeng_page.dart
import 'dongeng_update_form.dart'; // Mengganti poli_update_form.dart menjadi dongeng_update_form.dart
import '../model/dongeng.dart'; // Mengganti poli.dart menjadi dongeng.dart

class DongengDetail extends StatefulWidget {
  final Dongeng dongeng;

  const DongengDetail({Key? key, required this.dongeng}) : super(key: key);

  @override
  _DongengDetailState createState() => _DongengDetailState();
}

class _DongengDetailState extends State<DongengDetail> {
  Stream<Dongeng> getData() async* {
    Dongeng data = await DongengService().getById(widget.dongeng.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Dongeng")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot<Dongeng> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          Dongeng data = snapshot.data!;
          return Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Nama Dongeng : ${data.judul}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Penulis : ${data.penulis}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Tahun Terbit : ${data.tahunTerbit.toString()}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Isi Cerita : ${data.isiCerita}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Image.network(
                data.gambar,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tombolUbah(data),
                  _tombolHapus(data),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _tombolUbah(Dongeng dongeng) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DongengUpdateForm(dongeng: dongeng)),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  Widget _tombolHapus(Dongeng dongeng) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Konfirmasi"),
              content: const Text("Yakin ingin menghapus data ini?"),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    await DongengService().hapus(dongeng).then((value) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DongengPage()));
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("YA"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Tidak"),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"),
    );
  }
}

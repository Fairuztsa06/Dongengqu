import 'package:flutter/material.dart';
import '../model/dongeng.dart'; // Mengganti import dari poli.dart menjadi dongeng.dart
import '../service/dongeng_service.dart'; // Mengganti import dari poli_service.dart menjadi dongeng_service.dart
import 'dongeng_detail.dart'; // Mengganti poli_detail.dart menjadi dongeng_detail.dart

class DongengForm extends StatefulWidget {
  const DongengForm({Key? key}) : super(key: key);

  @override
  _DongengFormState createState() => _DongengFormState();
}

class _DongengFormState extends State<DongengForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaDongengCtrl = TextEditingController();
  final _penulisCtrl = TextEditingController();
  final _tahunTerbitCtrl = TextEditingController();
  final _isiCeritaCtrl = TextEditingController();
  final _gambarCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Dongeng")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaDongeng(),
              _fieldPenulis(),
              _fieldTahunTerbit(),
              _fieldIsiCerita(),
              _fieldGambar(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaDongeng() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Dongeng"),
      controller: _namaDongengCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Dongeng tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldPenulis() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Penulis"),
      controller: _penulisCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Penulis tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldTahunTerbit() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tahun Terbit"),
      controller: _tahunTerbitCtrl,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tahun Terbit tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldIsiCerita() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Isi Cerita"),
      controller: _isiCeritaCtrl,
      maxLines: null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Isi Cerita tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldGambar() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Gambar"),
      controller: _gambarCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Gambar tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Dongeng dongeng = Dongeng(
            judul: _namaDongengCtrl.text,
            penulis: _penulisCtrl.text,
            tahunTerbit: int.parse(_tahunTerbitCtrl.text),
            isiCerita: _isiCeritaCtrl.text,
            gambar: _gambarCtrl.text,
          );
          await DongengService().simpan(dongeng).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DongengDetail(dongeng: value)),
            );
          });
        }
      },
      child: const Text("Simpan"),
    );
  }
}

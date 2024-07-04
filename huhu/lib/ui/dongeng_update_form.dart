import 'package:flutter/material.dart';
import '../model/dongeng.dart'; // Mengganti import dari poli.dart menjadi dongeng.dart
import '../service/dongeng_service.dart'; // Mengganti import dari poli_service.dart menjadi dongeng_service.dart
import 'dongeng_detail.dart'; // Mengganti poli_detail.dart menjadi dongeng_detail.dart

class DongengUpdateForm extends StatefulWidget {
  final Dongeng dongeng;

  const DongengUpdateForm({Key? key, required this.dongeng}) : super(key: key);

  @override
  _DongengUpdateFormState createState() => _DongengUpdateFormState();
}

class _DongengUpdateFormState extends State<DongengUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaDongengCtrl = TextEditingController();
  final _penulisCtrl = TextEditingController();
  final _tahunTerbitCtrl = TextEditingController();
  final _isiCeritaCtrl = TextEditingController();
  final _gambarCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Dongeng data = await DongengService().getById(widget.dongeng.id.toString());
    setState(() {
      _namaDongengCtrl.text = data.judul;
      _penulisCtrl.text = data.penulis;
      _tahunTerbitCtrl.text = data.tahunTerbit.toString();
      _isiCeritaCtrl.text = data.isiCerita;
      _gambarCtrl.text = data.gambar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Dongeng")),
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
    );
  }

  Widget _fieldTahunTerbit() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tahun Terbit"),
      controller: _tahunTerbitCtrl,
      keyboardType: TextInputType.number,
    );
  }

  Widget _fieldIsiCerita() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Isi Cerita"),
      controller: _isiCeritaCtrl,
      maxLines: 4,
    );
  }

  Widget _fieldGambar() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Link Gambar"),
      controller: _gambarCtrl,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Dongeng dongeng = Dongeng(
            id: widget.dongeng.id,
            judul: _namaDongengCtrl.text,
            penulis: _penulisCtrl.text,
            tahunTerbit: int.parse(_tahunTerbitCtrl.text),
            isiCerita: _isiCeritaCtrl.text,
            gambar: _gambarCtrl.text,
          );
          await DongengService()
              .ubah(dongeng, widget.dongeng.id.toString())
              .then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DongengDetail(dongeng: value)),
            );
          });
        }
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}

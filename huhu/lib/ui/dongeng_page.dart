import 'package:flutter/material.dart';
import '../model/dongeng.dart'; // Mengganti import dari poli.dart menjadi dongeng.dart
import '../service/dongeng_service.dart'; // Mengganti import dari poli_service.dart menjadi dongeng_service.dart
import 'dongeng_detail.dart'; // Mengganti poli_detail.dart menjadi dongeng_detail.dart
import 'dongeng_form.dart'; // Mengganti poli_form.dart menjadi dongeng_form.dart
import 'dongeng_item.dart'; // Mengganti poli_item.dart menjadi dongeng_item.dart
import '../widget/sidebar.dart';

class DongengPage extends StatefulWidget {
  const DongengPage({Key? key}) : super(key: key);

  @override
  _DongengPageState createState() => _DongengPageState();
}

class _DongengPageState extends State<DongengPage> {
  Stream<List<Dongeng>> getList() async* {
    List<Dongeng> data = await DongengService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Dongeng"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DongengForm()),
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot<List<Dongeng>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Dongeng dongeng = snapshot.data![index];
              return ListTile(
                title: Text(
                    dongeng.judul), // Menggunakan namaDongeng sebagai contoh
                subtitle: Text(dongeng.penulis), // Menambahkan penulis
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DongengDetail(
                            dongeng:
                                dongeng)), // Mengganti PoliDetail menjadi DongengDetail
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

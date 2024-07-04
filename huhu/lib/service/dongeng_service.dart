import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/dongeng.dart'; // Sesuaikan dengan model yang diperbarui

class DongengService {
  Future<List<Dongeng>> listData() async {
    try {
      final Response response = await ApiClient().get('dongeng');
      final List data = response.data as List;
      List<Dongeng> result =
          data.map((json) => Dongeng.fromJson(json)).toList();
      return result;
    } catch (e) {
      throw Exception('Failed to load dongeng data: $e');
    }
  }

  Future<Dongeng> simpan(Dongeng dongeng) async {
    try {
      var data = dongeng.toJson();
      final Response response = await ApiClient().post('dongeng', data);
      Dongeng result = Dongeng.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception('Failed to save dongeng: $e');
    }
  }

  Future<Dongeng> ubah(Dongeng dongeng, String id) async {
    try {
      var data = dongeng.toJson();
      final Response response = await ApiClient().put('dongeng/$id', data);
      Dongeng result = Dongeng.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception('Failed to update dongeng: $e');
    }
  }

  Future<Dongeng> getById(String id) async {
    try {
      final Response response = await ApiClient().get('dongeng/$id');
      Dongeng result = Dongeng.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception('Failed to get dongeng by id: $e');
    }
  }

  Future<Dongeng> hapus(Dongeng dongeng) async {
    try {
      final Response response =
          await ApiClient().delete('dongeng/${dongeng.id}');
      Dongeng result = Dongeng.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception('Failed to delete dongeng: $e');
    }
  }
}

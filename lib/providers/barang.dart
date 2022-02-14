import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skansaba_finder/models/barang_model.dart';
import 'package:skansaba_finder/providers/auth.dart';
import '../config/config.dart';

class BarangProvider extends ChangeNotifier {
  Future<List<BarangModel>> get barang_all async {
    String param = "/api/barang/all";
    Uri url = Uri.parse(Config.BASEURL + param);
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer " + await Auth().token},
    );

    if (response.statusCode == 200) {
      List<BarangModel> barangAll = [];
      var responseJson = jsonDecode(response.body);
      for (final data in responseJson['data']) {
        barangAll.add(BarangModel(
          id: data['id'],
          nama: data['nama'],
          keterangan: data['keterangan'],
          gambar: data['gambar'],
          status: data['status'],
          tanggal: data['tanggal'],
          userId: data['user_id'],
          createdAt: data['created_at'],
          updatedAt: data['update_at'],
        ));
      }
      return barangAll;
    } else {
      print(response.body);
      return [];
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sota/app/data/constans/endpoint.dart';
import 'package:sota/app/data/models/response_bookNew.dart';
import 'package:sota/app/data/models/response_bookPopular.dart';
import 'package:sota/app/data/models/response_bookSearch.dart';
import 'package:sota/app/data/models/response_buku.dart';
import 'package:sota/app/data/models/response_kategori.dart';
import 'package:sota/app/data/provider/api_provider.dart';
import 'package:sota/app/data/provider/storage_provider.dart';

class MyState<T1, T2, T3, T4> {
  T1? state1;
  T2? state2;
  T3? state3;
  T4? state4;
  MyState({this.state1, this.state2, this.state3, this.state4});
}

class HomeController extends GetxController
    with
        StateMixin<
            MyState<List<DataBookNew>, List<DataBookPopular>,
                List<DataKategori>, List<DataBuku>>> {
  //TODO: Implement HomeController
  final TextEditingController search = TextEditingController();
  final RxInt searchLenght = 0.obs;
  final RxList<DataBukuSearch> listDataBuku = <DataBukuSearch>[].obs;
  final RxBool loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> searchData(String value) async {
    try {
      if (search.text.toString() == "") {
        listDataBuku.value = [];
        searchLenght.value = 0;
        return;
      }
      String data = jsonEncode({
        "query": search.text.toString(),
      });
      search.text.toString() != ""
          ? searchLenght.value = 1
          : searchLenght.value = 0;
      loading.value = true;
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().post(
          "${Endpoint.book}/search",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}),
          data: data);
      if (response.statusCode == 200) {
        loading.value = false;
        final ResponseBookSearch responseBook =
            ResponseBookSearch.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          listDataBuku.value = [];
        } else {
          listDataBuku.value = responseBook.data!;
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void increment() => count.value++;
  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().get(
          '${Endpoint.popular}/buku',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      final responseBukuNew = await ApiProvider.instance().get(
          '${Endpoint.book}/new',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      final responseKategoriBuku = await ApiProvider.instance().get(
          Endpoint.kategori,
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      final responseBukuData = await ApiProvider.instance().get(
          '${Endpoint.book}',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (responseBukuNew.statusCode == 200) {
        final ResponseBookPopular responseBookPopular =
            ResponseBookPopular.fromJson(response.data);
        final ResponseBuku responseBuku =
            ResponseBuku.fromJson(responseBukuData.data);
        final ResponseBookNew responseBookNew =
            ResponseBookNew.fromJson(responseBukuNew.data);
        final ResponseKategori responseKategori =
            ResponseKategori.fromJson(responseKategoriBuku.data);
        if (responseBookNew.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          final newData = MyState(
              state1: responseBookNew.data,
              state2: responseBookPopular.data,
              state3: responseKategori.data,
              state4: responseBuku.data);
          change(newData, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

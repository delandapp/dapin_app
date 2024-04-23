import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sota/app/data/constans/endpoint.dart';
import 'package:sota/app/data/models/response_bukukategori.dart';
import 'package:sota/app/data/provider/api_provider.dart';
import 'package:sota/app/data/provider/storage_provider.dart';

class MyState<T1> {
  T1? state1;
  MyState({this.state1});
}

class KategoriController extends GetxController
    with StateMixin<MyState<List<DataBukuKategori>>> {
  //TODO: Implement KategoriController
  final kategori = Get.parameters['kategori'];
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

  void increment() => count.value++;

  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().get(
          '${Endpoint.book}/kategori/${kategori}',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        final ResponseBukukategori responseBukukategori =
            ResponseBukukategori.fromJson(response.data);
        if (responseBukukategori.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          final newData = MyState(state1: responseBukukategori.data);
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

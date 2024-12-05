import 'package:get/get.dart';
import 'package:mini_project/service/picture/picture_service.dart';

class ListPictureController extends GetxController {
  var pictures = <dynamic>[].obs; // RxList untuk menyimpan daftar foto
  var isLoading = true.obs; // RxBool untuk status loading
  final PictureService _pictureService = PictureService();

  // Fetch data dari API
  Future<void> fetchPictures({int page = 1, int limit = 10}) async {
    try {
      isLoading.value = true; // Set status loading ke true
      final fetchedPictures =
          await _pictureService.fetchPictures(page: page, limit: limit);
      pictures.assignAll(fetchedPictures); // Menyimpan hasil fetch ke RxList
    } catch (e) {
      print('Error fetching pictures: $e');
    } finally {
      isLoading.value = false; // Set status loading ke false
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPictures(); // Memanggil API saat controller diinisialisasi
  }
}

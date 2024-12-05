import 'package:get/get.dart';
import 'package:mini_project/service/picture/picture_service.dart';

class DetailPictureController extends GetxController {
  var pictureDetail = {}.obs; // RxMap untuk menyimpan detail foto
  var isLoading = true.obs; // RxBool untuk status loading
  final PictureService _pictureService = PictureService();

  // Fetch detail foto berdasarkan ID
  Future<void> fetchPictureDetail(String id) async {
    try {
      isLoading.value = true; // Set status loading ke true
      final fetchedDetail = await _pictureService.fetchPictureDetail(id);
      pictureDetail.assignAll(fetchedDetail); // Menyimpan hasil fetch ke RxMap
    } catch (e) {
      print('Error fetching picture detail: $e');
    } finally {
      isLoading.value = false; // Set status loading ke false
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/module/picture/controller/detail_picture_controller.dart';
import 'package:mini_project/module/picture/widget/detail_content_widget.dart';

class DetailPictureView extends StatelessWidget {
  final controller = Get.put(DetailPictureController());

  @override
  Widget build(BuildContext context) {
    final picture = Get.arguments;

    controller.fetchPictureDetail(picture['id']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Photo'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final detail = controller.pictureDetail;
        return DetailContentWidget(
          imageUrl: detail['download_url'] ?? '',
          author: detail['author'] ?? '',
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/module/picture/controller/list_picture_controller.dart';
import 'package:mini_project/module/picture/widget/list_content_widget.dart';

class ListPictureView extends StatelessWidget {
  final controller = Get.put(ListPictureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Photo'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pictures.isEmpty) {
          return const Center(child: Text('No pictures available'));
        }

        return ListView.builder(
          itemCount: controller.pictures.length,
          itemBuilder: (context, index) {
            final picture = controller.pictures[index];
            return ListContentWidget(
              imageUrl: picture['download_url'],
              author: picture['author'],
              onTap: () {
                Get.toNamed('/detail', arguments: picture);
              },
            );
          },
        );
      }),
    );
  }
}

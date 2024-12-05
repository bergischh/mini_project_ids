import 'package:get/get.dart';
import 'package:mini_project/module/picture/controller/list_picture_controller.dart';
import 'package:mini_project/module/picture/controller/detail_picture_controller.dart';
import 'package:mini_project/module/picture/binding/picture_binding.dart';
import 'package:mini_project/module/picture/view/list_picture_view.dart';
import 'package:mini_project/module/picture/view/detail_picture_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.PHOTOS,
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}

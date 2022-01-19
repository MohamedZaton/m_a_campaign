import 'package:get/get.dart';
import 'package:m_a_camping/models/home_item_model.dart';
import 'package:m_a_camping/services/app_api.dart';
import 'package:m_a_camping/widgets/home_item_widget.dart';

class HomeLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <HomeItemWgt>[].obs;
  // List<HomeItemWgt> homeItems = <HomeItemWgt>[
  //   HomeItemWgt(
  //       infoText: "Absolute",
  //       imagePath: "assets/icons/absolute.png",
  //       onPress: () {}),
  //   HomeItemWgt(infoText: "infoText", imagePath: "", onPress: () {}),
  //   HomeItemWgt(infoText: "infoText", imagePath: "", onPress: () {}),
  //   HomeItemWgt(infoText: "infoText", imagePath: "", onPress: () {}),
  // ];

  @override
  void onReady() {
    ///implement onReady
    fetchList();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void fetchList() async {
    try {
      isLoading.value = true;
      List<HomeItemModel> homeItems = await AppApi.fetchHomeItems();
      mainItemList.value = List<HomeItemWgt>.from(
        homeItems.map(
          (item) => HomeItemWgt(
            homeItemModel: item,
          ),
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}

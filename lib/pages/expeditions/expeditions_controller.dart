import 'package:aquatropical/utils/requete.dart';
import 'package:get/get.dart';

class ExpeditionController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxList poissons = [].obs;
  RxList poissonsExp = [].obs;
  //
  load() async {
    change([], status: RxStatus.empty());
  }
  //

  getForMonth(String date) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("expedition/all/mois/$date");
    //
    if (response.isOk) {
      //
      print("response.body: ${response.body}");
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  //
  getForDay(String dateTime) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("expedition/all/jour/$dateTime");
    //
    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  //
  enregistrement(Map poisson, String date) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.postE("expedition", poisson);
    //
    if (response.isOk) {
      //
      Get.back();
      Get.snackbar("Succès", "Enregistrement éffectué");
      getForDay(date);
      //
    } else {
      //
      Get.back();
      Get.snackbar(
          "Oups", "Enregistrement non éffectué code: ${response.statusCode}");
      getForDay(date);
      //
    }
  }
  //
}

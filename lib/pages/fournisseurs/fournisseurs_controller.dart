import 'package:aquatropical/utils/requete.dart';
import 'package:get/get.dart';

class FournisseursController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  getAll() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("fournisseur/all");
    //
    if (response.isOk) {
      print("succes: ${response.statusCode}");
      print("succes: ${response.body}");
      //
      change(response.body, status: RxStatus.success());
    } else {
      print("erreur: ${response.statusCode}");
      print("erreur: ${response.body}");
      //
      change([], status: RxStatus.empty());
    }
  }

  //
  enregistrement(Map fournisseur) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.postE("fournisseur", fournisseur);
    //
    if (response.isOk) {
      //
      Get.back();
      Get.snackbar("Succès", "Enregistrement éffectué");
      getAll();
    } else {
      //
      Get.back();
      Get.snackbar(
          "Oups", "Enregistrement non éffectué code: ${response.statusCode}");
      getAll();
    }
  }

  //
}

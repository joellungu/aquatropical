import 'package:aquatropical/utils/requete.dart';
import 'package:get/get.dart';

class ProduitsController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  load() async {
    change([], status: RxStatus.empty());
  }

  //
  getAll() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("materiel/all");
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
}

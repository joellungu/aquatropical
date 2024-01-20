import 'package:aquatropical/utils/requete.dart';
import 'package:get/get.dart';

class JournalController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxList poissons = [].obs;
  RxList materiels = [].obs;
  RxMap fournisseur = {}.obs;
  RxList fraisSupplementaire = [].obs;
  //

  getForMonth(String date) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("facture/all/mois/$date");
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
    Response response = await requete.getE("facture/all/jour/$dateTime");
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
  //
  Future<Map> getAgent(String id) async {
    //
    //
    Response response = await requete.getE("agent/one/$id");
    //
    if (response.isOk) {
      //
      return response.body;
    } else {
      //
      return {};
    }
  }
}

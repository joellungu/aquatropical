import 'package:aquatropical/utils/requete.dart';
import 'package:get/get.dart';

class JournalController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  getForMonth(DateTime dateTime) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("poisson/all");
    //
    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }
}

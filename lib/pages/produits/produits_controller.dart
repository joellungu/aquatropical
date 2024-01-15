import 'package:get/get.dart';

class ProduitsController extends GetxController with StateMixin<List> {
  //
  load() async {
    change([], status: RxStatus.empty());
  }
}

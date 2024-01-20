import 'package:aquatropical/pages/produits/produits_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Produits extends GetView<ProduitsController> {
  List produits = [
    {"": ""}
  ];
  //
  Produits() {
    //
    controller.getAll();
    //
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: controller.obx(
        (state) {
          //
          RxList agents = RxList(state!);
          //
          RxString mot = "".obs;
          //
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  onChanged: (t) {
                    //
                    mot.value = t;
                    //
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Nom du materiel",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Obx(
                  () => ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    children: List.generate(agents.length, (index) {
                      //
                      Map produit = agents[index];
                      if ("${produit['nom']}"
                          .toLowerCase()
                          .contains(mot.value.toLowerCase())) {
                        return ListTile(
                          leading: SvgPicture.asset(
                            "assets/SolarBoxLinear.svg",
                            height: 30,
                            width: 30,
                          ),
                          title: Text(
                            "${produit['nom']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${produit['prix']} "),
                              Text(
                                "${produit['devise']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.indigo),
                              )
                            ],
                          ),
                          trailing: Text(
                            "${produit['quantite']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ),
                ),
              )
            ],
          );
        },
        onLoading: const Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ),
        onEmpty: Container(),
      ),
    );
  }
}

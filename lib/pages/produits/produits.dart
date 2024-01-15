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
    controller.load();
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
          List produits = state!;
          //
          return ListView(
            children: List.generate(produits.length, (index) {
              //
              Map produit = produits[index];
              return InkWell(
                splashColor: Colors.blue.shade100.withOpacity(0.5),
                onTap: () {
                  //
                  // Get.to(
                  //   Details(
                  //     {"profil": "assets/maq${index + 4}-removebg-preview.png"},
                  //   ),
                  // );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: Get.size.height / 5,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 1,
                          child: SizedBox(
                            height: Get.size.height / 7,
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            "Alice Masani",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //color: Colors.amber,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            "Macquilleuse Professionnelle",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //color: Colors.cyan,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade700,
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade700,
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade700,
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade700,
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade700,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                          //color: Colors.teal,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "À 5 min de vous",
                                            style: TextStyle(
                                              color: Colors.teal.shade700,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //color: Colors.teal,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Prix : ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                " 30000 Fc ",
                                                style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                          //color: Colors.teal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15, left: 5),
                        padding: const EdgeInsets.all(3),
                        height: Get.size.height / 4,
                        width: Get.size.width / 4.5,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade100.withOpacity(0.1),
                              Colors.blue.shade100.withOpacity(0.1),
                              Colors.blue.shade100.withOpacity(0.3),
                              Colors.blue.shade100.withOpacity(0.4),
                              Colors.blue.shade100.withOpacity(0.5),
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                              Colors.blue.shade300,
                              Colors.blue.shade700,
                            ],
                            //tileMode: TileMode.decal,
                            //stops: [0.1, 0.2, 0.3],
                          ),
                        ),
                        child: Hero(
                          tag: "assets/poisson_${index + 1}.png",
                          child: Image.asset(
                            "assets/poisson_${index + 1}.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
        onLoading: const Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ),
        onEmpty: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 55,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(5),
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        "assets/GalaSearch.svg",
                        height: 20,
                        width: 20,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  children: List.generate(produits.length, (index) {
                    //
                    Map produit = produits[index];
                    return InkWell(
                      splashColor: Colors.blue.shade100.withOpacity(0.5),
                      onTap: () {
                        //
                        // Get.to(
                        //   Details(
                        //     {"profil": "assets/maq${index + 4}-removebg-preview.png"},
                        //   ),
                        // );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: Get.size.height / 5,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 1,
                                child: SizedBox(
                                  height: Get.size.height / 7,
                                  width: double.maxFinite,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  "Mbongo",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //color: Colors.amber,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Aqua taquilium",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //color: Colors.cyan,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Taille 15",
                                                  style: TextStyle(
                                                    color: Colors.teal.shade700,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //color: Colors.teal,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Stock : ",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      " 3000 ",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      "pieces",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                //color: Colors.teal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 15, left: 5),
                              padding: const EdgeInsets.all(3),
                              height: Get.size.height / 4,
                              width: Get.size.width / 4.5,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blue.shade100.withOpacity(0.1),
                                    Colors.blue.shade100.withOpacity(0.1),
                                    Colors.blue.shade100.withOpacity(0.3),
                                    Colors.blue.shade100.withOpacity(0.4),
                                    Colors.blue.shade100.withOpacity(0.5),
                                    Colors.blue.shade100,
                                    Colors.blue.shade200,
                                    Colors.blue.shade300,
                                    Colors.blue.shade700,
                                  ],
                                  //tileMode: TileMode.decal,
                                  //stops: [0.1, 0.2, 0.3],
                                ),
                              ),
                              child: Hero(
                                tag: "assets/poisson_${index + 1}.png",
                                child: Image.asset(
                                  "assets/poisson_${index + 1}.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

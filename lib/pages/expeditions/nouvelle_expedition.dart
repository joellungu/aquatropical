import 'package:aquatropical/pages/expeditions/expeditions_controller.dart';
import 'package:aquatropical/utils/liste_poissons.dart';
import 'package:aquatropical/utils/liste_poissons_expedition.dart';
import 'package:aquatropical/utils/loader.dart';
import 'package:aquatropical/utils/recherche.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NouvelleExpedition extends StatelessWidget {
  //
  List roles = ["Expeditionniste", "Gestionnaire"];
  RxInt role = 0.obs;
  //
  RxString date = "".obs;
  //
  RxString pays = "République démocratique du Congo".obs;
  //
  final nom = TextEditingController();
  ExpeditionController expeditionController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle éxpedition"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Titre",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: nom,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(5),
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pays de destination",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                //height: 50,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Obx(
                        () => Text(pays.value),
                      ),
                    ),
                    CountryCodePicker(
                      onChanged: (c) {
                        //
                        print("${c.code}");
                        print("${c.name}");
                        pays.value = c.name!;
                      },
                      showDropDownButton: true,
                      showFlag: true,
                      initialSelection: 'CD',
                      favorite: ['+243', 'CD'],
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date d'expédition",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                //height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListTile(
                  onTap: () {
                    //
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2040),
                    ).then((d) {
                      if (d != null) {
                        date.value = "${d.day}-${d.month}-${d.year}";
                      }
                    });
                  },
                  title: Obx(
                    () => Text(date.value),
                  ), //
                  trailing: SvgPicture.asset(
                    "assets/SolarCalendarLinear.svg",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Poissons",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                //height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                //height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () {
                        //
                        showSimpleModal(ListPoissonsExpedition(), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    Obx(
                      () => Column(
                        children: List.generate(
                          expeditionController.poissonsExp.length,
                          (index) {
                            Map poisson =
                                expeditionController.poissonsExp[index];
                            return ListTile(
                              leading: SvgPicture.asset(
                                "assets/FluentEmojiHighContrastTropicalFish.svg",
                                height: 30,
                                width: 30,
                              ),
                              title: Text(
                                "${poisson['nom']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${poisson['prix']} "),
                                  const Text(
                                    "x ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "${poisson['quantite']} = ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "${double.parse(poisson['quantite']) * poisson['prix']} ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Text(
                                    "USD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  //
                                  expeditionController.poissonsExp
                                      .removeAt(index);
                                  //
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red.shade700,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 60,
              //   child: Obx(
              //     () => DropdownButtonHideUnderline(
              //       child: DropdownButton(
              //         isExpanded: true,
              //         padding: EdgeInsets.only(left: 10),
              //         value: role.value,
              //         onChanged: (e) {
              //           //
              //           role.value = e as int;
              //         },
              //         items: List.generate(
              //           roles.length,
              //           (index) => DropdownMenuItem(
              //             value: index,
              //             child: Text(
              //               "${roles[role.value]}",
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       border: Border.all(color: Colors.grey.shade500, width: 1)),
              // ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Loader.attente();
                  /**
                   * public String titre;
                   * public String date;
    public String heure;
    public String dateExpedition;
    public String heureExpedition;
    public String paysDestination;
    @ElementCollection
    public List<PoissonFac> poissons;

    @ElementCollection
    public List<MaterielFac> materiels;

    @ElementCollection
    @MapKeyColumn(name="name")
    @Column(name="value")
    @CollectionTable
    public Map<String, String> destinataire;

    @ElementCollection
    public List<FraisSupplementaire> fraisSupllementaire;
                   */
                  //
                  DateTime d = DateTime.now();
                  //
                  Map e = {
                    "titre": nom.text,
                    "date": "${d.day}-${d.month}-${d.year}",
                    "heure": "${d.hour}:${d.minute}",
                    "dateExpedition": date.value,
                    "heureExpedition": "",
                    "paysDestination": pays.value,
                    "poissons": expeditionController.poissonsExp.value,
                    //"materiels": "",
                    //"destinataire": "",
                    //"fraisSupllementaire": "",
                  };
                  //
                  expeditionController.enregistrement(
                    e,
                    "${d.day}-${d.month}-${d.year}",
                  );
                  //
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade700),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Ajouter",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

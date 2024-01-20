import 'package:aquatropical/pages/rapports/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DetailsExpedition extends StatelessWidget {
  //
  Map journal;
  DetailsExpedition(this.journal) {
    roles = [journal['type']];
    //
    //fournisseur = journal['fournisseur'];
    //
    materiels = journal['materiels'] ?? [];
    //
    poissons = journal['poissons'] ?? [];
    //
    frais = journal['fraisSupllementaire'] ?? [];
    //
  }
  //
  JournalController journalController = Get.find();
  //
  //Map fournisseur = {};
  //
  List poissons = [];
  //
  List materiels = [];
  //
  List frais = [];
  //
  final nom = TextEditingController();
  final postnom = TextEditingController();
  final prenom = TextEditingController();
  final telephone = TextEditingController();
  final adresse = TextEditingController();

  //
  List roles = ["Facture", "Achat materiel", "Perte poissons"];
  RxInt role = 0.obs;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        //${journal['titre']}
        title: Text("Details Expédition"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Titre",
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
                //height: 50,
                child: ListTile(
                  leading: const Icon(Icons.title),
                  title: Text(
                    "${journal['titre']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  //subtitle: Text("${journal['heure']}"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date & heure de création",
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
                //height: 50,
                child: ListTile(
                  leading: Icon(Icons.timelapse_outlined),
                  title: Text(
                    "${journal['date']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text("${journal['heure']}"),
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
                //height: 50,
                child: ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: Text(
                    "${journal['dateExpedition']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  //subtitle: Text("${journal['heure']}"),
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
                    // ListTile(
                    //   onTap: () {
                    //     //
                    //     showSimpleModal(ListPoissons(), context);
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Column(
                      children: List.generate(
                        poissons.length,
                        (index) {
                          Map poisson = poissons[index];
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
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${poisson['prix']} x ${poisson['quantite']} = ${poisson['quantite'] * poisson['prix']} USD",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Statut: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        journal['status'] == 0
                                            ? 'Indefinit'
                                            : journal['status'] == 1
                                                ? 'Complète'
                                                : 'Incomplète',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.indigo),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
                  "Produits & Materiels",
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
                    // ListTile(
                    //   onTap: () {
                    //     //
                    //     showSimpleModal(ListMateriels(), context);
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Column(
                      children: List.generate(
                        materiels.length,
                        (index) {
                          Map materiel = materiels[index];
                          return ListTile(
                            leading: SvgPicture.asset(
                              "assets/SolarBoxLinear.svg",
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              "${materiel['nom']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${materiel['prix']} "),
                                const Text(
                                  "x ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${materiel['quantite']} = ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${materiel['quantite'] * materiel['prix']} ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "USD",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.indigo),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
                  "Faris supplementaire",
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
                    // ListTile(
                    //   onTap: () {
                    //     //
                    //     showSimpleModal(FraisSupplementaire(), context);
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Column(
                      children: List.generate(
                        frais.length,
                        (index) {
                          Map f = frais[index];
                          return ListTile(
                            leading: SvgPicture.asset(
                              "assets/SolarBoxLinear.svg",
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              "${f['type']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${f['montant']} "),
                                Text(
                                  "${f['devise']} ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.indigo),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  //Loader.attente();
                  final pdf = pw.Document();

                  pdf.addPage(
                    pw.MultiPage(
                      margin: const pw.EdgeInsets.all(3),
                      header: (c) {
                        //
                        return pw.Column(
                          children: [
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text(
                                      "${journal['date']}   ${journal['heure']}"),
                                ),
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Center(
                                    child: pw.Text("${journal['titre']}"),
                                  ),
                                ),
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Container(
                                    alignment: pw.Alignment.centerRight,
                                    child: pw.Text("N° ${journal['id']}"),
                                  ),
                                ),
                              ],
                            ),
                            pw.Container(
                              margin: pw.EdgeInsets.all(1),
                              height: 2,
                              width: double.maxFinite,
                              color: PdfColors.black,
                            ),
                            pw.Container(
                              margin: pw.EdgeInsets.all(1),
                              height: 2,
                              width: double.maxFinite,
                              color: PdfColors.black,
                            ),
                            pw.SizedBox(
                              height: 10,
                            ),
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "AquaTropical",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                )
                              ],
                            ),
                            //
                            // pw.SizedBox(height: 10),
                            // pw.Container(
                            //   height: 15,
                            //   child: pw.Text(
                            //     "Agent",
                            //     style: pw.TextStyle(
                            //       color: PdfColors.white,
                            //     ),
                            //   ),
                            //   alignment: pw.Alignment.centerLeft,
                            //   color: PdfColors.black,
                            //   width: double.maxFinite,
                            // ),
                            // pw.Row(
                            //   mainAxisAlignment: pw.MainAxisAlignment.start,
                            //   children: [
                            //     pw.Text(
                            //         "${ags['nom']} ${ags['postnom']} ${ags['prenom']}")
                            //   ],
                            // ),
                            // pw.Row(
                            //   mainAxisAlignment: pw.MainAxisAlignment.start,
                            //   children: [pw.Text("${ags['telephone']} ")],
                            // ),
                            // pw.Row(
                            //   mainAxisAlignment: pw.MainAxisAlignment.start,
                            //   children: [pw.Text("${ags['adresse']} ")],
                            // ),

                            //
                            // pw.SizedBox(height: 10),
                            // fournisseur['nom'] == null
                            //     ? pw.Container()
                            //     : pw.Container(
                            //         height: 15,
                            //         child: pw.Text(
                            //           "Fournisseur",
                            //           style: pw.TextStyle(
                            //             color: PdfColors.white,
                            //           ),
                            //         ),
                            //         alignment: pw.Alignment.centerLeft,
                            //         color: PdfColors.black,
                            //         width: double.maxFinite,
                            //       ),
                            // fournisseur['nom'] == null
                            //     ? pw.Container()
                            //     : pw.Row(
                            //         mainAxisAlignment:
                            //             pw.MainAxisAlignment.start,
                            //         children: [
                            //           pw.Text(
                            //               "${fournisseur['nom']} ${fournisseur['postnom']} ${fournisseur['prenom']}")
                            //         ],
                            //       ),
                            // fournisseur['nom'] == null
                            //     ? pw.Container()
                            //     : pw.Row(
                            //         mainAxisAlignment:
                            //             pw.MainAxisAlignment.start,
                            //         children: [
                            //           pw.Text("${fournisseur['telephone']} ")
                            //         ],
                            //       ),
                            // fournisseur['nom'] == null
                            //     ? pw.Container()
                            //     : pw.Row(
                            //         mainAxisAlignment:
                            //             pw.MainAxisAlignment.start,
                            //         children: [
                            //           pw.Text("${fournisseur['adresse']} ")
                            //         ],
                            //       ),
                          ],
                        );
                      },
                      build: (c) {
                        return [
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Align(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                              "Poissons",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          pw.Container(
                            //height: 50,
                            //padding: pw.EdgeInsets.only(left: 10),
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(0),
                              border: pw.Border.all(
                                color: PdfColors.grey,
                              ),
                            ),
                            //height: 50,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Container(
                                  height: 15,
                                  color: PdfColors.black,
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text("NOM", style: entete2),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Row(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            children: [
                                              pw.Text("PRIX", style: entete2),
                                            ],
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text("QUANTITE",
                                              style: entete2),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child:
                                              pw.Text("TOTAL", style: entete2),
                                        ),
                                      ),
                                      pw.Align(
                                        alignment: pw.Alignment.centerLeft,
                                        child:
                                            pw.Text("DEVISE", style: entete2),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.Column(
                                  children: List.generate(
                                    poissons.length,
                                    (index) {
                                      Map poisson = poissons[index];
                                      return infos2(poisson,
                                          "assets/FluentEmojiHighContrastTropicalFish.svg");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Align(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                              "Produits & Materiels",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          pw.Container(
                            //height: 50,
                            padding: pw.EdgeInsets.only(left: 0),
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(5),
                              border: pw.Border.all(
                                color: PdfColors.grey,
                              ),
                            ),
                            //height: 50,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Container(
                                  height: 15,
                                  color: PdfColors.black,
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text("NOM", style: entete2),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Row(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            children: [
                                              pw.Text("PRIX", style: entete2),
                                            ],
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text("QUANTITE",
                                              style: entete2),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child:
                                              pw.Text("TOTAL", style: entete2),
                                        ),
                                      ),
                                      pw.Align(
                                        alignment: pw.Alignment.centerLeft,
                                        child:
                                            pw.Text("DEVISE", style: entete2),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.Column(
                                  children: List.generate(
                                    materiels.length,
                                    (index) {
                                      Map materiel = materiels[index];
                                      return infos2(materiel,
                                          "assets/SolarBoxLinear.svg");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Align(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                              "Faris supplementaire",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          pw.Container(
                            //height: 50,
                            //padding: pw.EdgeInsets.only(left: 10),
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(0),
                              border: pw.Border.all(
                                color: PdfColors.grey,
                              ),
                            ),
                            //height: 50,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Container(
                                  height: 15,
                                  color: PdfColors.black,
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text(
                                            "TYPE",
                                            style: const pw.TextStyle(
                                              color: PdfColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text(
                                            "MONTANT",
                                            style: const pw.TextStyle(
                                              color: PdfColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Align(
                                          alignment: pw.Alignment.centerLeft,
                                          child: pw.Text(
                                            "DEVISE",
                                            style: const pw.TextStyle(
                                              color: PdfColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.Column(
                                  children: List.generate(
                                    frais.length,
                                    (index) {
                                      Map f = frais[index];
                                      return infos1(
                                          f, "assets/SolarBoxLinear.svg");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 20,
                          ),
                        ];
                      },
                    ),
                  );
                  //
                  await Printing.layoutPdf(
                      onLayout: (PdfPageFormat format) async => pdf.save());
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
                    "Imprimer",
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

  //
  //
  pw.TextStyle entete1 = pw.TextStyle(
    fontSize: 7,
    fontWeight: pw.FontWeight.normal,
  );

  //
  pw.TextStyle entete2 = pw.TextStyle(
      //fontSize: 7,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.white);

  //
  pw.Container infos1(Map f, String path) {
    return pw.Container(
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                "${f['type']}",
                //style: entete2,
              ),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text("${f['montant']} "),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                "${f['devise']} ",
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  pw.Container infos2(Map poisson, String path) {
    return pw.Container(
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text("${poisson['nom']}"),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text("${poisson['prix']}"),
                ],
              ),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                "${poisson['quantite']}",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  //fontSize: 15,
                ),
              ),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                "${poisson['quantite'] * poisson['prix']}",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  //fontSize: 15,
                ),
              ),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              "USD",
            ),
          ),
        ],
      ),
    );
  }

  //
}

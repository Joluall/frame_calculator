import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:frame_calculator/app/data/models/calculation.dart';
import 'package:frame_calculator/app/data/models/glass.dart';
import 'package:frame_calculator/app/data/models/molding.dart';
import 'package:frame_calculator/app/data/repositories/remote/glass_repository.dart';
import 'package:frame_calculator/app/data/repositories/remote/molding_repository.dart';
import 'package:frame_calculator/app/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final GetStorage sessionBox = GetStorage();

  final MoldingRepository _moldingRepository = Get.find<MoldingRepository>();

  final GlassRepository _glassRepository = Get.find<GlassRepository>();

  TextEditingController anchuraController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  List<Glass> glasses = [];
  List<Molding> moldings = [];
  List<String> moldingStrings = [];
  List<String> calculationStrings = [];
  List<Calculation> calculations = [
    Calculation(
        id: 1,
        name: "Enmarcado para aficionado",
        formula:
            "precio_enmarcado_aficionado = (((((altura + anchura) x 2)+ 4 ) x precio_por_pulgada_moldura) + ((altura x anchura) x precio_por_pulgada_vidrio) + 10%)) + 35%"),
    Calculation(
      id: 2,
      name: "Marco para fotógrafo",
      formula:
          "precio_marco_fotografo = ((((altura + anchura) x 2)+ 4 ) x precio_por_pulgada_moldura) + ((altura x anchura) x precio_por_pulgada_vidrio) + 10%)",
    ),
    Calculation(
      id: 3,
      name: "Marco sin vidrio para aficionado",
      formula:
          "precio_marco_sin_vidrio_aficionado = ((((altura + anchura) x 2) + 4) x precio_por_pulgada_moldura) + 35%",
    ),
    Calculation(
      id: 4,
      name: "Marco sin vidrio para fotógrafo",
      formula:
          "precio_marco_sin_vidrio_fotografo = (((altura + anchura) x 2) + 4) * precio_por_pulgada_moldura",
    ),
    Calculation(
        id: 5,
        name: "Vidrio para aficionado",
        formula:
            "precio_vidrio_aficionado = ((altura x anchura) x precio_por_pulgada_vidrio) + 10%) + 35%"),
    Calculation(
        id: 6,
        name: "Vidrio para fotógrafo",
        formula:
            "precio_vidrio_fotografo = (altura x anchura) x precio_por_pulgada_vidrio) + 10%"),
  ];

  Decimal anchura;
  Decimal altura;
  Decimal total;

  Decimal precioVidrio;
  Decimal precioMoldura;

  Decimal enmarcadoAficionado;
  Decimal marcoFotografo;
  Decimal marcoSinVidrioAficionado;
  Decimal marcoSinVidrioFotografo;
  Decimal vidrioAficionado;
  Decimal vidrioFotografo;

  Decimal treintaycinco = Decimal.parse("35");
  Decimal cien = Decimal.parse("100");
  Decimal diez = Decimal.parse("10");
  Decimal dos = Decimal.parse("2");
  Decimal cuatro = Decimal.parse("4");

  Glass glass;
  Molding moldingSelected;
  Calculation calculationSelected;

  String userName = "";

  String moldingName = "";
  String calculationName = "";

  @override
  void onInit() {
    super.onInit();
    userName = sessionBox.read("user_name");
    load();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> load() async {
    glasses = await _glassRepository.getGlass();
    moldings = await _moldingRepository.getMolding();
    moldings.sort((a, b) => a.id.compareTo(b.id));
    glass = glasses[0];
    moldingStrings.clear();
    moldingSelected = moldings[0];

    for (Molding mol in moldings) {
      String m = mol.name;
      moldingStrings.add(m);
    }
    moldingName = moldingStrings[0];

    calculationStrings.clear();
    calculationSelected = calculations[0];

    for (Calculation cal in calculations) {
      String c = cal.name;
      calculationStrings.add(c);
    }
    calculationName = calculationStrings[0];
    makeTheCalculation();
    update(["home_b01"]);
    return true;
  }

  void dropDownButtonChange(String value) {
    moldingName = value;
    moldings.forEach((element) {
      if (element.name == value) {
        moldingSelected = element;
      }
    });
    makeTheCalculation();
  }

  void dropDownButtonChange2(String value) {
    calculationName = value;
    calculations.forEach((element) {
      if (element.name == value) {
        calculationSelected = element;
      }
    });
    makeTheCalculation();
  }

  logOut() {
    sessionBox.erase();
    Get.offAllNamed("/login");
  }

  void makeTheCalculation() {
    if (anchuraController.text == "" || alturaController.text == "") {
      total = null;
      update(["home_b01"]);
    } else {
      print("happening");
      anchura = setDecimal(anchuraController.text);
      altura = setDecimal(alturaController.text);
      precioMoldura = setDecimal(moldingSelected.price.toString());
      precioVidrio = setDecimal(glass.price.toString());

      vidrioFotografo = ((altura * anchura) * precioVidrio) +
          ((((altura * anchura) * precioVidrio) * diez) / cien);
      vidrioAficionado =
          (vidrioFotografo) + ((vidrioFotografo * treintaycinco) / cien);
      marcoSinVidrioFotografo =
          (((altura + anchura) * dos) + cuatro) * precioMoldura;
      marcoSinVidrioAficionado = (marcoSinVidrioFotografo) +
          ((marcoSinVidrioFotografo * treintaycinco) / cien);
      marcoFotografo = ((((altura + anchura) * dos) + cuatro) * precioMoldura) +
          vidrioFotografo;
      enmarcadoAficionado =
          (marcoFotografo) + ((marcoFotografo * treintaycinco) / cien);

      switch (calculationSelected.id) {
        case 1:
          total = enmarcadoAficionado;

          break;
        case 2:
          total = marcoFotografo;
          break;
        case 3:
          total = marcoSinVidrioAficionado;
          break;
        case 4:
          total = marcoSinVidrioFotografo;
          break;
        case 5:
          total = vidrioAficionado;

          break;
        default:
          total = vidrioFotografo;
      }
      update(["home_b01"]);
    }
  }
}

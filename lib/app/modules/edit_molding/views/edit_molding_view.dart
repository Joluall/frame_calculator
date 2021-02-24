import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:frame_calculator/app/global_widgets/text_form_fields/money_text_form_field.dart';

import 'package:get/get.dart';

import '../controllers/edit_molding_controller.dart';

class EditMoldingView extends GetView<EditMoldingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar moldura'),
        actions: [
          TextButton(
            child: Text(
              "GUARDAR",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              controller.editMolding();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: controller.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'No ha ingresado el nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.name = value;
                    },
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                  MoneyTextFormField(
                    initialValue: controller.price,
                    label: "Precio por pulgada L",
                    onSavedFunction: (value) {
                      controller.price = value;
                    },
                    validatorFunction: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese el Precio';
                      } else if (Decimal.parse(value) == Decimal.zero) {
                        return 'El precio no puede ser "0.00"';
                      }
                      return null;
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

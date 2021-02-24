import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Container(
                height: Get.context.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://i.imgur.com/IBZtTTn.png",
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          focusNode: controller.userNameFocusNode,
                          onEditingComplete: () {
                            FocusScope.of(context).nextFocus();
                          },
                          autofocus: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por ingrese su nombre de usuario';
                            }
                            return null;
                          },
                          controller: controller.userNameController,
                          decoration:
                              InputDecoration(labelText: 'Nombre de usuario:'),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          focusNode: controller.passwordFocusNode,
                          onFieldSubmitted: (value) {
                            if (controller.formKey.currentState.validate()) {
                              controller.load();
                            }
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingrese su contraseña';
                            }
                            return null;
                          },
                          controller: controller.passwordController,
                          decoration: InputDecoration(labelText: 'Contraseña:'),
                          obscureText: true,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(30.0),
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                child: Text('Iniciar Sesión'),
                                onPressed: () {
                                  if (controller.formKey.currentState
                                      .validate()) {
                                    controller.load();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

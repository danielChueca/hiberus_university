import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prueba_univevrsity/widget/custom_text_field.dart';

class FormImgePage extends StatefulWidget {
  const FormImgePage({super.key});

  @override
  State<FormImgePage> createState() => _FormImgePageState();
}

class _FormImgePageState extends State<FormImgePage> {
  bool _obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _file;
  String path = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.info))
            ],
            backgroundColor: const Color(0xFF6E5FDE),
            title: const Text("Image Form Page")),
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF6E5FDE), Colors.white])),
          child: Column(children: [
            const Text(
              'Rellena el formulario con tus datos personales para continuar.',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      nameController: _nameController,
                      labelText: 'Nombre',
                      hintText: 'Introduce tu nombre',
                      validation: (String? text) {
                        if (text!.isEmpty) {
                          return 'Campo obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      nameController: _surnameController,
                      labelText: 'Apellido',
                      hintText: 'Introduce tu Apellido',
                      validation: (String? text) {
                        if (text!.isEmpty) {
                          return 'Campo obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      nameController: _emailController,
                      labelText: 'Email',
                      hintText: 'Introduce tu Email',
                      validation: (String? text) {
                        if (text!.isEmpty) {
                          return 'El correo electrónico es obligatorio';
                        }
                        if (!text.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                          return 'Formato incorrecto';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                _obscureText = !_obscureText;
                                setState(() {});
                              },
                              icon: _obscureText
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          focusColor: Colors.black,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: "Contraseña",
                          hintText: "Introduce tu contraseña"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obligatorio';
                        }
                        if (value.length < 8) {
                          return 'debe tener mínimo 8 carácteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _dateController,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        _dateController.text =
                            DateFormat("dd/MM/yyyy").format(pickedDate!);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                _dateController.clear();
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete)),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          focusColor: Colors.black,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: "Fecha de nacimiento",
                          hintText: "Introduce la fecha"),
                      readOnly: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('Escoge un Source'),
                              content: const Text(
                                  'De donde quieres escoger la foto'),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'Cámara',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Galería',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: _file != null
                                    ? Image.file(_file!).image
                                    : const AssetImage(
                                        "assets/images/placeholder.png"))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF6E5FDE)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text('Submit succes'),
                                    content: SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(_nameController.text),
                                          Text(_surnameController.text),
                                          Text(_emailController.text),
                                          Text(_passwordController.text),
                                          Text(_dateController.text),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: const Text("Enviar")),
                    ),
                  ],
                ),
              ),
            ))
          ]),
        ),
      ),
    );
  }

  void pickImage(ImageSource source) async {
    final image = await ImagePicker()
        .pickImage(source: source, maxWidth: 1080, maxHeight: 1080);
    if (image == null) return;
    path = image.path;
    _file = File(path);
    setState(() {});
  }
}

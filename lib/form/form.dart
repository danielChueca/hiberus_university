import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _nombre = "";
  String _apellido = "";
  final String _correoElectronico = "";
  final String _numeroTelefono = "";
  final String _direccion = "";
  final String _password = "";
  bool _checkBox = false;
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario con validación'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onChanged: (text) {
                  _nombre = text;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                    label: Text("Nombre"),
                    hintText: "HOla",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.abc),
                    suffixIcon: Icon(Icons.remove_red_eye)),
                onChanged: (text) {
                  _apellido = text;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'El apellido es obligatorio';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   decoration:
              //       const InputDecoration(labelText: 'Correo electrónico'),
              //   onChanged: (text) {
              //     _correoElectronico = text;
              //   },
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'El correo electrónico es obligatorio';
              //     }
              //     if (!value.contains(RegExp(
              //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
              //       return 'Formato incorrecto';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   decoration:
              //       const InputDecoration(labelText: 'Número de teléfono'),
              //   onChanged: (text) {
              //     _numeroTelefono = text;
              //   },
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'El número de teléfono es obligatorio';
              //     }
              //     if (value.length < 9) {
              //       return 'El número de teléfono debe tener al menos 9 dígitos';
              //     }
              //     return null;
              //   },
              // ),
              // TextField(
              //   decoration: const InputDecoration(labelText: 'Dirección'),
              //   onChanged: (text) {
              //     _direccion = text;
              //   },
              // ),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Contraseña'),
              //   onChanged: (text) {
              //     _password = text;
              //   },
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Campo obligatorio';
              //     }
              //     if (value.length < 8) {
              //       return 'debe tener mínimo 8 carácteres';
              //     }
              //     return null;
              //   },
              // ),
              // Datepicker
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
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),

              CupertinoSwitch(
                  activeColor: Colors.red,
                  thumbColor: Colors.amber,
                  value: _checkBox,
                  onChanged: (value) {
                    setState(() {
                      _checkBox = !_checkBox;
                      // _checkBox = value!;
                    });
                  }),
              ListTile(
                leading: Checkbox(
                    value: _checkBox,
                    onChanged: (value) {
                      setState(() {
                        _checkBox = !_checkBox;
                        // _checkBox = value!;
                      });
                    }),
                title: const Text("CheckBox"),
              ),
              Row(
                children: [
                  Checkbox(
                      value: _checkBox,
                      onChanged: (value) {
                        setState(() {
                          _checkBox = !_checkBox;
                          // _checkBox = value!;
                        });
                      }),
                  const Text("CheckBox")
                ],
              ),
              TextButton(
                child: const Text('Enviar'),
                onPressed: () {
                  // Validar el formulario

                  if (_formKey.currentState!.validate()) {
                    // Realizar la acción deseada con los datos introducidos
                  } else {
                    // Mostrar un mensaje de error
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

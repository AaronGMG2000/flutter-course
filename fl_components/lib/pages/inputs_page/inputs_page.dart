import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsPage extends StatelessWidget {
  const InputsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Map<String, String> data = {
      'firstName': '',
      'lastName': '',
      'email': '',
      'password': '',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre de Usuario',
                  formProperty: 'firstName',
                  formValues: data,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido de Usuario',
                  formProperty: 'lastName',
                  formValues: data,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo de Usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: data,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña de Usuario',
                  keyboardType: TextInputType.visiblePassword,
                  formProperty: 'password',
                  formValues: data,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'Supervisor', child: Text('Supervisor')),
                    DropdownMenuItem(
                        value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(
                        value: 'Jr. Developer', child: Text('Jr. Developer')),
                  ],
                  onChanged: (value) {
                    data['role'] = value ?? 'Admin';
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(data);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text('Guardar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

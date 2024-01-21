import 'package:flutter/material.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonst_custom_theme.dart';
import '../widgets/input_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _lasNameController = TextEditingController();
  TextEditingController _brithDayController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  Text('Complete sign up', style: letterBold),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  const Divider(thickness: 1),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                  InputWidget(
                    hintText: 'Luis',
                    controller: _nameController,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    guy: 'Name',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  InputWidget(
                    hintText: 'Ordoñez',
                    controller: _lasNameController,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    guy: 'Last name',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                 // CustomDatePickerInputWidget (
                 //   controller: _brithDayController,
                 //   hintText: 'mm/dd/yyyy',
                 //   labelText: 'Birthday',
                 //   guy: 'Birthday',
                 // ),
                  //   DateInputWidget(
                  //       controller: _brithDayController,
                  //       hintText: 'mm/dd/yyyy',
                  //       guy: 'Birthday',
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

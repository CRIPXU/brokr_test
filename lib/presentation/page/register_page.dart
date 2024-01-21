
import 'package:brokr_prueba/presentation/widgets/country_region_selector_widget.dart';
import 'package:brokr_prueba/presentation/widgets/date_input_widget.dart';
import 'package:brokr_prueba/presentation/widgets/input_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonst_custom_theme.dart';
import '../widgets/input_widget.dart';
import '../widgets/text_color_button_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _lasNameController = TextEditingController();
  TextEditingController _countryRegionController = TextEditingController();
  TextEditingController _brithDayController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String country = '+1';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: Dimensions.MARGIN_SIZE_AUTH),
                Text('Complete sign up', style: letterBold),
                const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                const Divider(thickness: 1),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                  InputWidget(
                    hintText: 'Luis',
                    controller: _nameController,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    labelText: 'Name',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  InputWidget(
                    hintText: 'Ordoñez',
                    controller: _lasNameController,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    labelText: 'Last name',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  DateInputWidget(
                      controller: _brithDayController,
                      hintText: 'mm/dd/yyyy',
                      labelText: 'Birthday',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  CountryRegionSelectorTextFieldWidget(
                      controller: _countryRegionController,
                    hintText: '+1',
                    labelText: 'Country/Region',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  InputIconWidget(
                    hintText: '(973) 842-5678',
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Number Phone',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  const Divider(thickness: 1),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  InputIconWidget(
                    hintText: 'user@brokr.com',
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  InputIconWidget(
                    hintText: '********',
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  InputIconWidget(
                    hintText: '********',
                    controller: _repeatPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Repeat Password',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.HOME_PAGE_PADDING),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: GoogleFonts.inter(color: const Color(0xFF505050)),
                          children: [
                            TextSpan(
                              style: letter,
                              text: 'By clicking continue you are agreeing to our ',
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.inter(fontWeight: FontWeight.bold,color: Colors.black),
                            ),
                            TextSpan(
                              style: letter,
                              text: ' and ',
                            ),
                            TextSpan(
                              text: 'Terms & Conditions.',
                              style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  TextColorButtonWidget(
                    colorButton: const Color(0xFF675DFE),
                      colorText: const Color(0xFFFFFFFF),
                      onPressed: (){},
                      text: 'Agree and continue')
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

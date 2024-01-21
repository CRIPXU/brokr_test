import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/fonst_custom_theme.dart';

class CountryRegionSelectorTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;

  CountryRegionSelectorTextFieldWidget({
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  _CountryRegionSelectorTextFieldWidgetState createState() =>
      _CountryRegionSelectorTextFieldWidgetState();
}

class _CountryRegionSelectorTextFieldWidgetState
    extends State<CountryRegionSelectorTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () {
        _openCountryPickerDialog(context);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: widget.hintText,
        suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        helperMaxLines: 45,
        suffixStyle: titleRegular,
        errorMaxLines: 45,
        errorStyle: robotoRegular,
        hintMaxLines: 1,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
      ),
    );
  }

  void _openCountryPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Country'),
          content: SingleChildScrollView(
            child: CountryRegionSelectorWidget(controller: widget.controller),
          ),
        );
      },
    );
  }
}

class CountryRegionSelectorWidget extends StatefulWidget {
  final TextEditingController controller;

  CountryRegionSelectorWidget({required this.controller});

  @override
  _CountryRegionSelectorWidgetState createState() =>
      _CountryRegionSelectorWidgetState();
}

class _CountryRegionSelectorWidgetState
    extends State<CountryRegionSelectorWidget> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: _openCountryPickerDialog,
          leading: _selectedCountry != null
              ? Container(
                  width: 30,
                  height: 30,
                  child: FutureBuilder<Uint8List?>(
                    future: _loadImage(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Image.memory(snapshot.data!);
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              : null,
          title: Text(_selectedCountry?.displayName ?? 'Select Country'),
          //subtitle: Text(_selectedCountry?.countryCode ?? '+1'),
          trailing: const Icon(Icons.arrow_drop_down),
        ),
      ],
    );
  }

  void _openCountryPickerDialog() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
        widget.controller.text = _selectedCountry!.countryCode ?? '';
      },
    );
  }

  Future<Uint8List?> _loadImage() async {
    try {
      // Desactivar la verificación de certificados
      var client = http.Client();
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://www.countryflags.io/${_selectedCountry!.countryCode}/flat/64.png'));
      var response = await client.send(request);

      if (response.statusCode == 200) {
        return await response.stream.toBytes();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

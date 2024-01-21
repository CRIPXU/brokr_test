import 'package:brokr_prueba/core/utils/dimensions.dart';
import 'package:brokr_prueba/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/fonst_custom_theme.dart';

Widget TextColorButtonWidget({
  required void Function()? onPressed,
  required String text,
  Color colorButton = Colors.black,
  Color colorText = Colors.black,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: colorButton,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
          Text(text,
              style: GoogleFonts.inter(
                  color: colorText,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    ),
  );
}

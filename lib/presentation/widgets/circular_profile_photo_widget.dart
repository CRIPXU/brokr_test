import 'package:brokr_prueba/core/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularProfilePhotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        alignment: Alignment.topCenter,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage(Images.USER_PROFILE_AVATAR_SVGREPO),
                radius: 125,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: GestureDetector(
                onTap: () {
                  _showOptionsDialog(context);
                },
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(Images.CAMARA_FLAT),
                      const SizedBox(width: 8),
                      Text('Upload',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF505050),
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showOptionsDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoFullscreenDialogTransition(
          primaryRouteAnimation: const AlwaysStoppedAnimation(1),
          secondaryRouteAnimation: const AlwaysStoppedAnimation(0.001),
          linearTransition: true,
          child: CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  // Handle Choose from Photo Library
                  Navigator.pop(context);
                },
                child: Text(
                  'Choose from Photo Library',
                  style: GoogleFonts.inter(
                      color: const Color(0xFF007AFF),
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  // Handle Take Photo
                  Navigator.pop(context);
                },
                child: Text(
                  'Take Photo',
                  style: GoogleFonts.inter(
                      color: const Color(0xFF007AFF),
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(
                    color: const Color(0xFFFF3B30),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? userName;
  final String salutation;

  const CustomCircleAvatar({
    Key? key,
    this.imageUrl,
    this.userName,
    required this.salutation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 28,
            child: Row(
              children: <Widget>[
                if (imageUrl != null)
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(imageUrl!),
                  )
                else
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0,left: 13.0,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Hi${userName != null ? ', $userName!' : ''}',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF505050),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(salutation,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF505050),
                      ),
                    ),
                  ],
                ),
                Text('Good Morning!',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF505050),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

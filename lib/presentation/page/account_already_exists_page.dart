import 'package:brokr_prueba/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AccountAlreadyExistsPage extends StatelessWidget {
  const AccountAlreadyExistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT))
          ],
        ),
      ),
    );
  }
}

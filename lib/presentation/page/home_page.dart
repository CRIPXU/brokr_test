import 'package:brokr_prueba/presentation/widgets/custom_circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/images.dart';
import '../controllers/global_controller.dart';
import 'alert_preloads.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
       return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 23),
                const CustomCircleAvatar(salutation: 'Christin'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: Dimensions.MARGIN_SIZE_BIG_LARGE),
                      Image.asset(Images.EMPTY_VERIFIED),
                      ],
                    ),
                  ),if (globalController.isLoading.value) AlertPreloads(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  goToLoginBox(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          titlePadding: const EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 10),
          contentPadding: const EdgeInsets.only(bottom: 30,left: 30,right: 30,top: 20),
          title: Text(
            "You are not logged in.",
            style: ralewayBold(black, 26),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Please log in to access this feature.",
                style: ralewayMedium(black, 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  context.beamToReplacementNamed('/login');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "goToLogin".tr,
                    style: ralewayMedium(white, 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
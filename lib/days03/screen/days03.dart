import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/core/app_assets_images.dart';
import 'package:flutter_30_days_plan/days03/widgets/insurance.dart';
import 'package:flutter_30_days_plan/days03/widgets/services.dart';
import 'package:flutter_30_days_plan/days03/widgets/search.dart';

class Days03 extends StatefulWidget {
  const Days03({super.key});

  @override
  State<Days03> createState() => _Days03State();
}

class _Days03State extends State<Days03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dubai",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                Row(
                  children: [
                    Text(
                      "UAE, Dubai",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(AppAssetsImages.treat, width: 70, height: 60),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          "100",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Image.asset(
                  AppAssetsImages.notification,
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AppAssetsImages.dog),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            SizedBox(height: 10),
            Expanded(child: Services()),
            SizedBox(height: 10),
            Expanded(child: Insurance()),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

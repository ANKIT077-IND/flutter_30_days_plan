import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/core/app_assets_images.dart';

class Services extends StatelessWidget {
  Services({super.key});

  List<Map<String, dynamic>> servicesList = [
    {"name": "Grooming", "image": AppAssetsImages.grooming},
    {"name": "Shop", "image": AppAssetsImages.shop},
    {"name": "Day Care", "image": AppAssetsImages.daycare},
    {"name": "Boarding", "image": AppAssetsImages.boarding},
    {"name": "Veterinary", "image": AppAssetsImages.veterinary},
    {"name": "Adoption", "image": AppAssetsImages.adoption},
    {"name": "Dog Friendly", "image": AppAssetsImages.dog_friendly},
    {"name": "Training", "image": AppAssetsImages.training},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            itemCount: servicesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              mainAxisExtent: 90,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        servicesList[index]["image"].toString(),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(height: 5),
                      Text(
                        servicesList[index]["name"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

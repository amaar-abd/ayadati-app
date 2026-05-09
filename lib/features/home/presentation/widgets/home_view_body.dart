import 'package:ayadati/features/home/presentation/widgets/custom_home_row.dart';
import 'package:ayadati/features/home/presentation/widgets/recommended_doctors_listview.dart';
import 'package:ayadati/features/home/presentation/widgets/recommended_doctors_row.dart';
import 'package:ayadati/features/home/presentation/widgets/specialties_gridview.dart';
import 'package:flutter/material.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}


class _HomeViewBodyState extends State<HomeViewBody> {
bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 8),
            CustomHomeRow(
              isExpanded: isExpanded,
              onPressed: 
                () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                }            
            ),
            SizedBox(height: 8),
            SpecialtiesGridview(isExpanded: isExpanded),
            SizedBox(height: 10),
            RecommendedDoctorsRow(),
            SizedBox(height: 8),
            RecommendedDoctorsListview()
          ],
        ),
      ),
    );
  }
}

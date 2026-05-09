import 'package:ayadati/features/home/presentation/models/specialty_ui_model.dart';
import 'package:ayadati/features/home/presentation/views/specialty_doctors_view.dart';
import 'package:ayadati/features/home/presentation/widgets/specialty_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpecialtiesGridview extends StatelessWidget {
  const SpecialtiesGridview({super.key, required this.isExpanded});
  final bool isExpanded;
  final List<SpecialtyModel> specialties = const [
    SpecialtyModel(title: 'قلبية', icon: FontAwesomeIcons.heartPulse),
    SpecialtyModel(title: 'أسنان', icon: FontAwesomeIcons.tooth),
    SpecialtyModel(title: 'عيون', icon: FontAwesomeIcons.solidEye),
    SpecialtyModel(title: 'نسائية', icon: FontAwesomeIcons.venus),
    SpecialtyModel(title: 'جلدية', icon: FontAwesomeIcons.handDots),
    SpecialtyModel(title: 'أطفال', icon: FontAwesomeIcons.baby),
    SpecialtyModel(title: 'أذنية', icon: FontAwesomeIcons.earListen),
    SpecialtyModel(
      title: 'عظمية',
      icon: FontAwesomeIcons.personWalkingWithCane,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: isExpanded ? specialties.length : 6,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => SpecialtyCard(
        model: specialties[index],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SpecialtyDoctorsView(specialtyName: specialties[index].title),
            ),
          );
        },
      ),
    );
  }
}

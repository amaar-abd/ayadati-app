import 'package:ayadati/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:ayadati/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody(),appBar: CustomHomeAppbar(),);
  }
}

import 'package:ayadati/features/appointments/presentation/views/appointments_view.dart';
import 'package:ayadati/features/home/presentation/views/home_view.dart';
import 'package:ayadati/features/main_layout/presentation/widgets/custom_botton_nav_bar.dart';
import 'package:ayadati/features/profile/presentation/views/profile_view.dart';
import 'package:ayadati/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';


class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int _currentIndex = 0;
  final List<Widget> _views = [
    HomeView(),
    SearchView(),
    AppointmentsView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottonNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(index: _currentIndex, children: _views),
    );
  }
}

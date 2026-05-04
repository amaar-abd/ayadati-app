import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MedicalAuthHeader extends StatelessWidget {
  const MedicalAuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MedicalClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryBlue, Color(0xFF283593)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              left: 10,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.accentGold.withAlpha(40),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 20,
                top: MediaQuery.of(context).padding.top - 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "إنشاء حساب جديد",
                    style: TextTheme.of(context).bodyLarge?.copyWith(
                      color: AppColors.textOnPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 3,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.accentGold,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "انضم إلينا للحصول على أفضل رعاية طبية",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);

    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 60);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

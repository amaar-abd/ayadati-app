import 'package:ayadati/core/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildDoctorImage extends StatelessWidget {
  const BuildDoctorImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.accentGold.withAlpha(200),
          width: 1,
        ),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                CircularProgressIndicator(color: AppColors.primaryBlue),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

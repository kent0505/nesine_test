import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';

class ClubData extends StatelessWidget {
  const ClubData({
    super.key,
    required this.title,
    required this.image,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SvgPicture.asset('assets/$asset.svg'),
          CachedNetworkImage(
            imageUrl: image,
            height: 35,
            errorWidget: (context, url, error) {
              return SvgPicture.asset('assets/logo1.svg');
            },
          ),
          const SizedBox(height: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.navBarIcon,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

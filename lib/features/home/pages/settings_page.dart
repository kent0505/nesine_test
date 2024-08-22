import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Column(
        children: [
          SizedBox(height: 40 + getStatusBar(context)),
          const _Title(),
          const SizedBox(height: 68),
          const _SettingsTile(
            title: 'Share with friends',
            id: 1,
          ),
          const SizedBox(height: 25),
          const _SettingsTile(
            title: 'Subscription info',
            id: 2,
          ),
          const SizedBox(height: 25),
          const _SettingsTile(
            title: 'Terms of use',
            id: 3,
          ),
          const SizedBox(height: 25),
          const _SettingsTile(
            title: 'Privacy Policy',
            id: 4,
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 5),
        Text(
          'Settings',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32,
            fontFamily: Fonts.bold,
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.settingsTile,
      ),
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 18),
            SvgPicture.asset('assets/settings$id.svg'),
            const SizedBox(width: 9),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: Fonts.regular,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: AppColors.white,
              size: 30,
            ),
            const SizedBox(width: 9),
          ],
        ),
      ),
    );
  }
}

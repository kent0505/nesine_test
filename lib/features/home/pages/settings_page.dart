import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/title_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleText('Settings'),
        SizedBox(height: 68),
        _SettingsTile(
          title: 'Share with friends',
          id: 1,
        ),
        SizedBox(height: 25),
        _SettingsTile(
          title: 'Subscription info',
          id: 2,
        ),
        SizedBox(height: 25),
        _SettingsTile(
          title: 'Terms of use',
          id: 3,
        ),
        SizedBox(height: 25),
        _SettingsTile(
          title: 'Privacy Policy',
          id: 4,
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
      margin: const EdgeInsets.symmetric(horizontal: 33),
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

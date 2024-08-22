import 'package:flutter/material.dart';

import '../../../core/widgets/title_text.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleText('News'),
      ],
    );
  }
}

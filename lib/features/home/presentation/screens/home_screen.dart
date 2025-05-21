import 'package:flutter/material.dart';

import '../../../../core/app_constants/app_strings.dart';
import '../../../../core/app_constants/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.appBarTitle,
          style: ApptTextStyles.font20BlackMedium,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SafeArea(
        child: SizedBox.expand(child: Center(child: Text('Home Screen ...'))),
      ),
    );
  }
}

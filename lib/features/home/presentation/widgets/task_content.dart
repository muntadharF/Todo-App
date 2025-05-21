import 'package:flutter/material.dart';

import '../../../../core/app_constants/app_text_styles.dart';

class TaskContent extends StatelessWidget {
  const TaskContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Title todo is here",
        style: ApptTextStyles.font14PrimaryColorMedium,
      ),
      subtitle: Text(
        "Description todo is here Eu est sit qui fugiat fugiat non nulla amet quis ullamco aliqua.",
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text("Status"),
    );
  }
}

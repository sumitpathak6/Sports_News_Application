import 'package:flutter/material.dart';
import 'package:sports_news/utils/colors.dart';
import 'package:sports_news/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: const [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText(text: 'Tech', size: 20, color: AppColors.primary),
            modifiedText(text: 'News', size: 20, color: AppColors.lightwhite)
          ],
        ),
      ),
    );
  }
}

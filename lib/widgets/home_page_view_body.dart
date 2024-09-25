import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/widgets/home_page_view_body_lower_part.dart';
import 'package:to_do_list_app/widgets/home_page_view_body_upper_part.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        HomePageViewBodyLowerPart(),
        HomePageViewBodyUpperPart(),
      ],
    );
  }
}



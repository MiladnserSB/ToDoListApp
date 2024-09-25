import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/widgets/custom_app_bar.dart';

class HomePageViewBodyUpperPart extends StatefulWidget {
  const HomePageViewBodyUpperPart({super.key});

  @override
  _HomePageViewBodyUpperPartState createState() =>
      _HomePageViewBodyUpperPartState();
}

class _HomePageViewBodyUpperPartState extends State<HomePageViewBodyUpperPart> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> texts = [
    "Every small step counts; keep moving forward!",
    "Success is the sum of small efforts, repeated day in and day out.",
    "Believe in yourself, and you will be unstoppable!",
    "Your only limit is you, push beyond your boundaries!",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: kPriamryColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const CustomAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: PageView.builder(
                controller: _pageController,
                itemCount: texts.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      texts[index],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: texts.length,
            effect: const WormEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 18,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

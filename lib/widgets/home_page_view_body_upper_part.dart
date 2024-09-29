import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/widgets/home_page_view_app_bar.dart';

class HomePageViewBodyUpperPart extends StatefulWidget {
  const HomePageViewBodyUpperPart({super.key});

  @override
  _HomePageViewBodyUpperPartState createState() =>
      _HomePageViewBodyUpperPartState();
}

class _HomePageViewBodyUpperPartState
    extends State<HomePageViewBodyUpperPart> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> texts = [
    "Every small step counts; keep moving forward!",
    "Success is the sum of small efforts, repeated day in and day out.",
    "Believe in yourself, and you will be unstoppable!",
    "Your only limit is you, push beyond your boundaries!",
  ];

  @override
  void initState() {
    super.initState();
    // Start the timer to automatically switch pages every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < texts.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/home_view_image.png'),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const HomePageViewAppBar(),
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
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500), // Duration of the fade transition
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Text(
                        texts[index],
                        key: ValueKey<int>(index), // Key to distinguish between different texts
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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

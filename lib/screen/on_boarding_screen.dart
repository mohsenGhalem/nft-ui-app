import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nft_app_ui/constants.dart';
import 'package:nft_app_ui/screen/home_screen.dart';
import 'package:nft_app_ui/views/home_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animatiedController;
  late AnimationController controller;
  late Animation<Offset> _animatiedController;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    controller.forward();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.forward();
    animatiedController = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut));
    _animatiedController = Tween<Offset>(
            begin: const Offset(0, 100), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeigh = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeigh,
        width: screenwidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(92, 96, 155, 1),
                Color.fromRGBO(118, 124, 178, 1),
              ]),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: screenHeigh,
              width: screenwidth,
              child: Image.asset(
                Constants.nOnBording,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => Transform.scale(
                    scale: animatiedController.value,
                    child: Container(
                      margin: EdgeInsets.only(top: screenHeigh * 0.1, left: 10),
                      child: const Text(
                        "Welcome to\nNFT Marketplace",
                        style: TextStyle(
                            color: Constants.nShadowW,
                            fontSize: 38,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _animatiedController,
                  child: GlassmorphicContainer(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 40),
                    width: screenwidth * 0.8,
                    height: screenwidth * 0.55,
                    borderRadius: 25,
                    linearGradient: LinearGradient(colors: [
                      Constants.nShadowW.withOpacity(0.2),
                      Constants.nShadowD.withOpacity(0.2)
                    ]),
                    border: 2,
                    blur: 8,
                    borderGradient: LinearGradient(colors: [
                      Constants.nShadowW.withOpacity(0.3),
                      Colors.grey.withOpacity(0.3)
                    ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Explore and Mint NFTs',
                            style: TextStyle(
                                color: Constants.nShadowW,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'You can buy and sell the NFTs of the best artists in the world.',
                            style: TextStyle(
                                color: Constants.nShadowW.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => const HomeView()));
                            },
                            child: GlassmorphicContainer(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 40),
                              width: 200,
                              height: 50,
                              borderRadius: 25,
                              linearGradient: LinearGradient(colors: [
                                Constants.nBtn,
                                Constants.nShadow.withOpacity(0.7),
                              ]),
                              border: 2,
                              blur: 5,
                              borderGradient: const LinearGradient(colors: [
                                Constants.nBtn,
                                Color.fromARGB(255, 99, 61, 177),
                                //  Colors.grey.withOpacity(0.3)
                              ]),
                              child: const Text(
                                'Get started now',
                                style: TextStyle(
                                    color: Constants.nShadowW,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

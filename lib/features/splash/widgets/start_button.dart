import 'package:flutter/material.dart';
import 'package:integrated_todo/core/navigation/named_routes.dart';
import 'package:integrated_todo/core/utilities/ui_utilities/lens_clipper.dart';

class SplashStartButton extends StatefulWidget {
  const SplashStartButton({super.key});

  @override
  State<SplashStartButton> createState() => _SplashStartButtonState();
}

class _SplashStartButtonState extends State<SplashStartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animationDdouble;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationDdouble = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        // reverseCurve: Curves.bounceOut,
      ),
    );

    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: animationDdouble,
          builder: (context, x) {
            return Transform.scale(
              scale: animationDdouble.value,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ClipPath(
                    clipper: LensRoundedClipper(),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(NamedRoutes.navScreen);
                        },
                        child: Ink(
                          child: Ink(
                            width: double.infinity,
                            height: 52,

                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF6A5AE0), Color(0xFF8E5AF7)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  color: Color(0xff2555FF).withAlpha(90),
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                Spacer(),

                                Text(
                                  "Let's Start",
                                  //style: TextStyle(color: Colors.white),
                                  style: TextTheme.of(context).headlineSmall
                                      ?.copyWith(color: Colors.white),
                                ),

                                SizedBox(width: constraints.maxWidth * 0.2),

                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),

                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

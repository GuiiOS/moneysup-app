import 'package:app/app/components/splash_buttons.dart';
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorsApp colors = ColorsApp.instance;
    final TextStyles text = TextStyles.instance;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              padding: EdgeInsets.only(
                top: size.maxHeight * .1,
                bottom: 32,
                right: 32,
                left: 32,
              ),
              height: size.maxHeight,
              width: size.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'moneysup',
                    textAlign: TextAlign.center,
                    style: text.textExtraBold.copyWith(
                      fontSize: 64,
                      color: colors.textWhite,
                    ),
                  ),
                  SplashButtons(
                    modalHeight: size.maxHeight * .4,
                    width: size.maxWidth,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

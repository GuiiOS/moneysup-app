import 'package:app/app/components/login_form.dart';
import 'package:app/app/screens/register_screen.dart';
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SplashButtons extends StatelessWidget {
  final double modalHeight;
  final double width;
  SplashButtons({super.key, required this.modalHeight, required this.width});

  final ColorsApp colors = ColorsApp.instance;
  final TextStyles text = TextStyles.instance;

  @override
  Widget build(BuildContext context) {
    Route createRoute({required bool isOffline}) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegisterScreen(isOffline: isOffline),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    void modal(double height) {
      showModalBottomSheet<void>(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        enableDrag: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return FormLoginComponent(height: height);
        },
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              createRoute(isOffline: false),
            ),
            child: Text(
              'Criar conta',
              style: text.textRegular.copyWith(
                color: colors.textWhite,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width,
          child: TextButton(
            onPressed: () => modal(modalHeight),
            child: Text(
              'Já tenho conta',
              style: text.textRegular.copyWith(
                color: colors.textWhite,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Divider(),
              ),
              const SizedBox(width: 4),
              Text(
                'OU',
                style: context.textStyles.textBold
                    .copyWith(color: ColorsApp.instance.textWhite),
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Divider(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width,
          child: TextButton(
            onPressed: () => Navigator.of(context).push(
              createRoute(isOffline: true),
            ),
            child: Text(
              'Usar offline',
              style: text.textRegular.copyWith(
                color: colors.textWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

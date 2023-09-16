import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FormLoginComponent extends StatefulWidget {
  final double height;

  const FormLoginComponent({super.key, required this.height});

  @override
  State<FormLoginComponent> createState() => _FormLoginComponentState();
}

class _FormLoginComponentState extends State<FormLoginComponent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();

    _passwordController.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _emailFocus.unfocus();
        _passwordFocus.unfocus();
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Form(
          key: _formKey,
          child: Container(
            height: widget.height,
            color: ColorsApp.instance.secondary,
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Bom te ver novamente!',
                  style: context.textStyles.textBold.copyWith(fontSize: 18),
                ),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: ColorsApp.instance.secondary,
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: ColorsApp.instance.textWhite,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        FocusNode().requestFocus(_passwordFocus);
                      },
                      focusNode: _emailFocus,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: ColorsApp.instance.secondary,
                        hintText: 'Senha',
                        prefixIcon: Icon(
                          Icons.password_rounded,
                          color: ColorsApp.instance.textWhite,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onFieldSubmitted: (_) {
                        FocusNode().unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      focusNode: _passwordFocus,
                      controller: _passwordController,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Entrar',
                      style: context.textStyles.textRegular.copyWith(
                        color: ColorsApp.instance.textWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

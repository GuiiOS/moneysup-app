import 'package:app/app/models/user.dart';
import 'package:app/app/repositories/users.dart';
import 'package:app/app/statics/routes.dart';
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  final bool isOffline;
  const RegisterScreen({super.key, required this.isOffline});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nickNameController = TextEditingController();
  final FocusNode _nickNameFocus = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _nickNameController.dispose();
    _nickNameFocus.dispose();

    _emailController.dispose();
    _emailFocus.dispose();

    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _continue() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    if (widget.isOffline) {
      if (_nickNameController.text.isEmpty) return;

      ref
          .read(userProvider)
          .create(
            User(
              id: null,
              nickName: _nickNameController.text,
              email: null,
              createdAt: DateTime.now().toString(),
              updatedAt: DateTime.now().toString(),
              token: null,
            ),
          )
          .then((value) {
        final u = ref.watch(userProvider).user;

        if (u.nickName != '' && u.nickName.isNotEmpty) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.dashboardScreen, (route) => false);
        }
      });
    }

    if (_nickNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, size) {
          return Container(
            height: size.maxHeight,
            width: size.maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.isOffline
                      ? 'Bem vindo(a)! Como você gostaria de ser chamado(a)?'
                      : 'Bem vindo(a)! Para criar a sua conta preencha todos os campos abaixo.',
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 24,
                    color: ColorsApp.instance.textWhite,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: widget.isOffline
                      ? Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Apelido',
                                prefixIcon: Icon(
                                  Icons.person_rounded,
                                  color: ColorsApp.instance.textWhite,
                                ),
                              ),
                              style: context.textStyles.textRegular.copyWith(
                                  color: ColorsApp.instance.textWhite),
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                FocusNode().requestFocus(_emailFocus);
                              },
                              validator: (nickNameValue) {
                                final nickName = nickNameValue ?? '';

                                if (nickName.trim().isEmpty) {
                                  return 'Informe como gostaria de ser chamado(a)';
                                }

                                return null;
                              },
                              focusNode: _nickNameFocus,
                              controller: _nickNameController,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Apelido',
                                prefixIcon: Icon(
                                  Icons.person_rounded,
                                  color: ColorsApp.instance.textWhite,
                                ),
                              ),
                              style: context.textStyles.textRegular.copyWith(
                                  color: ColorsApp.instance.textWhite),
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                FocusNode().requestFocus(_emailFocus);
                              },
                              validator: (nickNameValue) {
                                final nickName = nickNameValue ?? '';

                                if (nickName.trim().isEmpty) {
                                  return 'Informe como gostaria de ser chamado(a)';
                                }

                                return null;
                              },
                              focusNode: _nickNameFocus,
                              controller: _nickNameController,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email_rounded,
                                  color: ColorsApp.instance.textWhite,
                                ),
                              ),
                              style: context.textStyles.textRegular.copyWith(
                                  color: ColorsApp.instance.textWhite),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                FocusNode().requestFocus(_passwordFocus);
                              },
                              validator: (emailValue) {
                                final email = emailValue ?? '';

                                if (email.isEmpty) {
                                  return 'Informe seu email';
                                }

                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(email)) {
                                  return 'Informe um email válido';
                                }

                                return null;
                              },
                              focusNode: _emailFocus,
                              controller: _emailController,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                prefixIcon: Icon(
                                  Icons.password_rounded,
                                  color: ColorsApp.instance.textWhite,
                                ),
                              ),
                              style: context.textStyles.textRegular.copyWith(
                                  color: ColorsApp.instance.textWhite),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              onFieldSubmitted: (_) {
                                FocusNode().unfocus();
                              },
                              validator: (passwordValue) {
                                final password = passwordValue ?? '';

                                if (password.trim().isEmpty) {
                                  return 'Informe sua nova senha';
                                }

                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              focusNode: _passwordFocus,
                              controller: _passwordController,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _continue,
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}

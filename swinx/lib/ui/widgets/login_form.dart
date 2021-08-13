import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swinx/providers/app_provider.dart';
import 'package:swinx/providers/login_form_provider.dart';
import 'package:swinx/router/routes.dart';
import 'package:swinx/services/user_service.dart';
import 'package:swinx/ui/widgets/text_banner.dart';

import 'package:swinx/utils/color.dart';
import 'package:swinx/utils/font.dart';
import 'package:swinx/utils/validations.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final LoginFormProvider loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      height: 400,
      width: 500,
      key: loginForm.formKey,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.black87,
            blurRadius: 30,
          ),
        ],
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _formTitle(),
            const SizedBox(
              height: 40,
            ),
            _userTextBox(loginForm),
            const SizedBox(
              height: 10,
            ),
            _passwordTextBox(loginForm),
            const SizedBox(
              height: 20,
            ),
            _loginButtons(context, loginForm),
            const SizedBox(
              height: 30,
            ),
            _externalLoginOptions(),
          ],
        ),
      ),
    );
  }

  Widget _formTitle() {
    return Text(
      'Enter credentials',
      style: titleStyle,
    );
  }

  Widget _formSubTitle() {
    return Center(
      child: Text(
        'Or use',
        style: titleStyle,
      ),
    );
  }

  Widget _userTextBox(LoginFormProvider loginForm) {
    final txt = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextFormField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        onChanged: (value) {
          loginForm.email = value;
        },
        validator: (value) {
          RegExp regExp = new RegExp(emailFormatPattern);
          return regExp.hasMatch(value ?? '')
              ? ''
              : 'e-mail address is not valid';
        },
        controller: txt,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(
            Icons.email,
            color: Colors.blue,
          ),
          hintText: 'user email',
        ),
      ),
    );
  }

  Widget _passwordTextBox(LoginFormProvider loginForm) {
    final txt = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextFormField(
        autocorrect: false,
        autofocus: true,
        controller: txt,
        obscureText: true,
        onChanged: (value) {
          loginForm.password = value;
        },
        validator: (value) {
          if (value != null && value.length > 5) return null;
          return 'Password should not be empty and has at least 6 chars';
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          hintText: 'password',
        ),
      ),
    );
  }

  Widget _loginButtons(BuildContext context, LoginFormProvider loginForm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _logInButton(context, loginForm),
        _forgotPasswordButton(),
      ],
    );
  }

  Widget _logInButton(BuildContext context, LoginFormProvider loginForm) {
    final AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return ElevatedButton(
      onPressed: loginForm.isLoading
          ? null
          : () async {
              FocusScope.of(context).unfocus();

              loginForm.isLoading = true;
              if (!loginForm.isValidForm()) return;

              final UserService userService = UserService();
              final result = await userService.login(
                username: loginForm.email,
                password: loginForm.password,
              );
              if (result.ok!) {
                Navigator.pushReplacementNamed(context, homeRoute);
              } else {
                loginForm.isLoading = false;
                appProvider.bannerText = result.responseMessage;
                appProvider.bannerType = BannerType.error;
              }
            },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(themeBlue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            loginForm.isLoading
                ? CircularProgressIndicator()
                : Icon(Icons.login_sharp),
            const SizedBox(width: 10),
            Text(
              loginForm.isLoading ? 'Validating' : 'Log In',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: Text('forgot password?'),
    );
  }

  Widget _externalLoginOptions() {
    return Column(
      children: [
        _formSubTitle(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _googleLogin(),
            _facebookLogin(),
            _twitterLogin(),
          ],
        ),
      ],
    );
  }

  Widget _googleLogin() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(googleColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              FontAwesomeIcons.google,
            ),
            const SizedBox(width: 10),
            Text(
              'Google',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _facebookLogin() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(facebookColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              FontAwesomeIcons.facebook,
            ),
            const SizedBox(width: 10),
            Text(
              'facebook',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _twitterLogin() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(twitterColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              FontAwesomeIcons.twitter,
            ),
            const SizedBox(width: 10),
            Text(
              'twitter',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

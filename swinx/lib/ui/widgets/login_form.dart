import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swinx/utils/color.dart';
import 'package:swinx/utils/font.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 500,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _formTitle(),
          const SizedBox(
            height: 40,
          ),
          _userTextBox(),
          const SizedBox(
            height: 10,
          ),
          _passwordTextBox(),
          const SizedBox(
            height: 20,
          ),
          _loginButtons(),
          const SizedBox(
            height: 30,
          ),
          _externalLoginOptions(),
        ],
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

  Widget _userTextBox() {
    final txt = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextField(
        autocorrect: false,
        autofocus: true,
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

  Widget _passwordTextBox() {
    final txt = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextField(
        autocorrect: false,
        autofocus: true,
        controller: txt,
        obscureText: true,
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

  Widget _loginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _logInButton(),
        _forgotPasswordButton(),
      ],
    );
  }

  Widget _logInButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(themeBlue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.login_sharp,
            ),
            const SizedBox(width: 10),
            Text(
              'Log In',
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

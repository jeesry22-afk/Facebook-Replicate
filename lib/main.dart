import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const SocialLoginApp());

class SocialLoginApp extends StatelessWidget {
  const SocialLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook – log in or sign up',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0866ff)),
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const blue = Color(0xff0866ff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final desktop = constraints.maxWidth >= 900;
          return Column(
            children: [
              Expanded(
                child: desktop
                    ? Row(
                        children: [
                          Expanded(
                            flex: 69,
                            child: _HeroPanel(height: constraints.maxHeight),
                          ),
                          const VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: Color(0xffdadde1),
                          ),
                          const Expanded(flex: 31, child: _LoginPanel()),
                        ],
                      )
                    : const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 640, child: _LoginPanel()),
                            SizedBox(
                              height: 640,
                              child: _HeroPanel(height: 640),
                            ),
                          ],
                        ),
                      ),
              ),
              if (desktop) const _Footer(),
            ],
          );
        },
      ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 42,
          top: 40,
          child: SvgPicture.asset(
            'assets/brand/facebook.svg',
            width: 55,
            height: 55,
          ),
        ),
        Positioned(
          left: 24,
          bottom: 44,
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 56,
                height: 1.03,
                fontWeight: FontWeight.w700,
                color: Color(0xff0b0b0d),
              ),
              children: [
                TextSpan(text: 'Explore the\nthings '),
                TextSpan(
                  text: 'you\nlove',
                  style: TextStyle(color: LoginPage.blue),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
        ),
        Positioned(
          left: 300,
          right: 38,
          top: 56,
          bottom: 40,
          child: Image.asset(
            'assets/images/social_collage.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _LoginPanel extends StatelessWidget {
  const _LoginPanel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 492),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  Icon(Icons.arrow_back_ios_new, size: 18),
                  SizedBox(width: 24),
                  Text(
                    'Log into Facebook',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              const _Field(hint: 'Email or mobile number'),
              const SizedBox(height: 10),
              const _Field(hint: 'Password', obscure: true),
              const SizedBox(height: 22),
              SizedBox(
                height: 42,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: LoginPage.blue,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              SizedBox(
                height: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: LoginPage.blue),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Create new account',
                    style: TextStyle(
                      color: Color(0xff004ac4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/brand/meta.svg',
                    width: 57,
                    height: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.hint, this.obscure = false});
  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xff1c1e21), fontSize: 15),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xffccd0d5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: LoginPage.blue, width: 1.5),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  static const languages = [
    'English (US)',
    'Filipino',
    'Bisaya',
    'Español',
    '日本語',
    '한국어',
    '中文(简体)',
    'More languages...',
  ];
  static const links = [
    'Sign Up',
    'Log In',
    'Messenger',
    'Facebook Lite',
    'Video',
    'Meta Pay',
    'Meta Store',
    'Meta Quest',
    'Ray-Ban Meta',
    'Meta AI',
    'Muse',
    'Instagram',
    'Threads',
    'Privacy Policy',
    'Privacy Center',
    'About',
    'Create ad',
    'Create Page',
    'Developers',
    'Careers',
    'Cookies',
    'Ad choices ▹',
    'Terms',
    'Help',
    'Contact Uploading & Non-Users',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xffdadde1))),
      ),
      padding: const EdgeInsets.fromLTRB(24, 27, 24, 15),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 28,
                runSpacing: 10,
                children: languages.map(_item).toList(),
              ),
              const SizedBox(height: 13),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: links.map(_item).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(String text) => Text(
        text,
        style: const TextStyle(color: Color(0xff4b5b72), fontSize: 12),
      );
}

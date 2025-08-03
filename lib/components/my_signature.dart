import 'package:flutter/material.dart';

class SignatureBanner extends StatefulWidget {
  const SignatureBanner({super.key});

  @override
  State<SignatureBanner> createState() => _SignatureBannerState();
}

class _SignatureBannerState extends State<SignatureBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Center(
            child: Text(
              'Mini Project by @Reo:)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: Theme.of(context).colorScheme.secondary,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

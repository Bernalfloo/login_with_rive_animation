import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  // Rive
  StateMachineController? _controller;
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;
  SMINumber? _numLook;

  // Focus
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Timer? _typingDebounce;

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        if (_isHandsUp != null && _numLook != null) {
          _isHandsUp!.change(false);
          _numLook!.value = 50.0;
        }
      }
    });

    _passwordFocusNode.addListener(() {
      if (_isHandsUp != null) {
        _isHandsUp!.change(_passwordFocusNode.hasFocus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  'assets/animated_login_bear.riv',
                  stateMachines: const ['Login Machine'],
                  fit: BoxFit.contain,
                  onInit: (artboard) {
                    _controller = StateMachineController.fromArtboard(
                      artboard,
                      'Login Machine',
                    );

                    if (_controller == null) return;

                    artboard.addController(_controller!);

                    _isChecking =
                        _controller!.findSMI('isChecking') as SMIBool?;
                    _isHandsUp = _controller!.findSMI('isHandsUp') as SMIBool?;
                    _trigSuccess =
                        _controller!.findSMI('trigSuccess') as SMITrigger?;
                    _trigFail = _controller!.findSMI('trigFail') as SMITrigger?;
                    _numLook = _controller!.findSMI('numLook') as SMINumber?;
                  },
                ),
              ),
              const SizedBox(height: 24),

              // EMAIL
              TextField(
                focusNode: _emailFocusNode,
                onChanged: (value) {
                  if (_isChecking == null || _numLook == null) return;

                  _isChecking!.change(true);

                  final look = (value.length / 80.0 * 100.0).clamp(0.0, 100.0);
                  _numLook!.value = look;

                  // reiniciar debounce
                  _typingDebounce?.cancel();

                  _typingDebounce = Timer(const Duration(seconds: 1), () {
                    if (!mounted) return;
                    _isChecking?.change(false);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // PASSWORD
              TextField(
                focusNode: _passwordFocusNode,
                obscureText: _obscureText,
                onChanged: (_) {
                  _typingDebounce?.cancel();

                  _isChecking?.change(false);
                  _isHandsUp?.change(true);
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _typingDebounce?.cancel();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _typingDebounce?.cancel();
    super.dispose();
  }
}

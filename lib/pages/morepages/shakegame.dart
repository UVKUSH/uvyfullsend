import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class ShakeGameScreen extends StatefulWidget {
  @override
  _ShakeGameScreenState createState() => _ShakeGameScreenState();
}

class _ShakeGameScreenState extends State<ShakeGameScreen>
    with SingleTickerProviderStateMixin {
  static const double shakeThreshold = 15.0;
  int shakeCounter = 0;
  StreamSubscription? _accelerometerSubscription;
  double _lastX = 0, _lastY = 0, _lastZ = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      double deltaX = (event.x - _lastX).abs();
      double deltaY = (event.y - _lastY).abs();
      double deltaZ = (event.z - _lastZ).abs();

      if (deltaX > shakeThreshold ||
          deltaY > shakeThreshold ||
          deltaZ > shakeThreshold) {
        setState(() {
          shakeCounter++;
        });
      }

      _lastX = event.x;
      _lastY = event.y;
      _lastZ = event.z;
    });

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: -0.15, end: 0.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shake Game', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value,
                    child: Image.asset(
                      'assets/shake hand.png',
                      height: 300,
                      width: 300,
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Looking for people shaking their phone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Shake Count: $shakeCounter',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

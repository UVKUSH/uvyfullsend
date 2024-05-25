import 'package:flutter/material.dart';
import 'package:fullsend/pages/morepages/shakegame.dart';

class HeartScreen extends StatefulWidget {
  @override
  _HeartScreenState createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800), // Decrease the duration
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Famous', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShakeGameScreen()),
                );
              },
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value,
                        child: Image.asset(
                          'assets/shake hand.png',
                          height: 222, // Adjust the height as needed
                          width: 222, // Adjust the width as needed
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle Limelight Go Famous tap
                // Add your custom logic here
              },
              child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    'Limelight Go Famous',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color:
                  Colors.grey[300], // Background color for people who like you
              child: Center(
                child: Text(
                  'People Who Like You',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

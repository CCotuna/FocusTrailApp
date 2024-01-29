import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'TimerTreePage.dart';
import '../common/strings.dart' as strings;

class HomePage extends StatefulWidget {
  /// The constructor takes the key parameter to identify the widget
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Logo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'FocusTrail.png',
                height: 50,
              ),
            ),

            /// Title
            Text(
              strings.appBarTitle,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,

        /// Center the title
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            /// Center vertically
            children: [
              /// Add Lottie animation
              Lottie.asset(
                'HomeScreenTree.json',
                width: 500,

                /// height: 300,
              ),

              /// Title and description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                /// Left and right padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  /// Center vertically
                  children: [
                    Text(
                      strings.homeScreenTitle,
                      style: const TextStyle(fontSize: 20, letterSpacing: 2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),

                    /// Spacing between title and description
                    Text(
                      strings.homeScreenDescription,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center, // Align text to center
                    ),
                  ],
                ),
              ),

              // Add a button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(
                        255, 7, 56, 13), // Change the text color
                    minimumSize: const Size(200, 50), // Button size
                  ),
                  onPressed: () {
                    /// Navigate to TimerTreePage when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TimerTreePage(),
                      ),
                    );
                  },
                  child: Text(strings.homeScreenButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

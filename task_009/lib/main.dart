import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Text Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<AnimatedTextExample> _examples;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _examples = animatedTextExamples(onTap: () {

    });
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _examples[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          animatedTextExample.label,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(color: animatedTextExample.color),
            height: 300.0,
            width: 300.0,
            child: Center(
              key: ValueKey(animatedTextExample.label),
              child: animatedTextExample.child,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index = ++_index % _examples.length;
          });
        },
        tooltip: 'Next',
        child: const Icon(
          Icons.play_circle_filled,
          size: 50.0,
        ),
      ),
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}

// Colorize Text Style
const _colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

// Colorize Colors
const _colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

List<AnimatedTextExample> animatedTextExamples({VoidCallback? onTap}) =>
    <AnimatedTextExample>[
      AnimatedTextExample(
        label: 'Scale',
        color: Colors.blue[700],
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 70.0,
            fontFamily: 'Canterbury',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText('Hello'),
              ScaleAnimatedText('Hey'),
            ],
          ),
        ),
      ),
      AnimatedTextExample(
        label: 'Colorize',
        color: Colors.blueGrey[50],
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Hello',
              textStyle: _colorizeTextStyle,
              colors: _colorizeColors,
            ),
            ColorizeAnimatedText(
              'Hello world',
              textStyle: _colorizeTextStyle,
              colors: _colorizeColors,
            ),

          ],
        ),
      ),
      AnimatedTextExample(
        label: 'Text Liquid Fill',
        color: Colors.white,
        child: TextLiquidFill(
          text: 'Hello',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.redAccent,
          textStyle: const TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
      AnimatedTextExample(
        label: 'Wavy Text',
        color: Colors.purple,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 20.0,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Hello World',
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WavyAnimatedText('Hello'),
              WavyAnimatedText('Hello world'),
            ],
            onTap: onTap,
          ),
        ),
      ),
      AnimatedTextExample(
        label: 'Flicker',
        color: Colors.pink[300],
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 35,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: Colors.white,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText('Hello '),
              FlickerAnimatedText('Hello World'),
            ],

          ),
        ),
      ),

    ];
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:line/GestureProvider.dart';
import 'package:line/wigets/ryan_face.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) => GestureProvider(), child: MyHomePage()),
    );
  }
}

//221, 155, 37
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> _tween;
  late Animation<double> _animation;

  late Offset firstPos;

  @override
  void initState() {
    // TODO: implement initState

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _tween = Tween<double>();
    _animation = _tween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut));

    _animationController.addListener(() {
      Provider.of<GestureProvider>(context, listen: false).setGap =
          _animation.value;
    });

    super.initState();
  }

  void backToNormal(double gap) {
    _tween.begin = gap;
    _tween.end = 0;
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<GestureProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 155, 37),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragStart: (s) {
          // 처음 포지션이 어디인지
          if (!_animationController.isAnimating) {
            firstPos = s.globalPosition;
          }
        },
        onVerticalDragUpdate: (s) {
          // 어디로 얼만큼 움직였는지

          if (!_animationController.isAnimating) {
            var gap =
                s.globalPosition.dy - firstPos.dy; // -> 아래로 이동할시 +, 위로 이동할 시 -
            gap *= .05;
            p.setGap = gap;
          }
        },
        onVerticalDragEnd: (s) {
          // 손 뗀것을 인식 -> 돌아가는 애니메이션 발동 !

          if (!_animationController.isAnimating) {
            backToNormal(p.gap);
          }
        },
        child: Container(
          child: Center(child: RyanFace()),
        ),
      ),
    );
  }
}

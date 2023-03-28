import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../GestureProvider.dart';

class RyanFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<GestureProvider>(context);

    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ryanEyePart(p.degree),
                SizedBox(
                  width: 70,
                ),
                _ryanEyePart(-p.degree),
              ],
            ),
            _ryanNose()
          ],
        ),
      ),
    );
  }

  Widget _ryanEyePart(double degree) {
    return Column(
      children: [RotationTransition(
          turns: AlwaysStoppedAnimation(degree/360),
          child: _eyebrow()), _eye()],
    );
  }

  Widget _eyebrow() {
    return Container(
      width: 85,
      height: 16,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
    );
  }

  Widget _eye() {
    return Container(
        margin: EdgeInsets.only(top: 27),
        width: 30,
        height: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black));
  }

  Widget _ryanNose() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 41),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
          Container(
            margin: EdgeInsets.only(left: 41),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
          RotationTransition(
            turns: AlwaysStoppedAnimation(55 / 360),
            child: Container(
              margin: EdgeInsets.only(left: 4, bottom: 10),
              height: 17,
              width: 17,
              color: Colors.white,
            ),
          ),
          RotationTransition(
            turns: AlwaysStoppedAnimation(-55 / 360),
            child: Container(
              margin: EdgeInsets.only(right: 4, bottom: 10),
              height: 17,
              width: 17,
              color: Colors.white,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(bottom: 37),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
          )
        ],
      ),
    );
  }
}

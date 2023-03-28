import 'package:flutter/cupertino.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> strList=["첫번째","두번째"];
final change=(String str){
  return

  Text(str);
};
    List<Widget> widgerList=
      strList.map((e) => change(e)).toList();

    return SafeArea(child: Column(

      children:widgerList,
    ));
  }
}

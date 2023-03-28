import 'package:flutter/material.dart';

class second extends StatelessWidget {
  const second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> strList2 = ['a', 'ab', 'abc', 'da', 'de', 'def'];
    
final fitter = (String str){
  return str.contains("a");
};
final change =(String str){
  return Text(str,key:UniqueKey());
};




    List<Widget> WhereFiter=
    strList2.where((e) => fitter(e) ).map((e) => change(e)).toList();


  
    RegExp exp = RegExp('^a.*');
    List<Widget> matches = strList2
        .where((str) => exp.hasMatch(str))
        .map((e) => change(e)).toList();


    return SafeArea(
        child: Column(
          children: WhereFiter+matches,
        )
    );
  }
}

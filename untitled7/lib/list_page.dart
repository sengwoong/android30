import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:untitled7/post_dto.dart';
import 'package:http/http.dart'as http;
class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


//실제 데이터
  final listState = useState<List<PostDtoTable>?>(null);


useEffect((){
  String url = "https://jsonplaceholder.typicode.com/users";
  http.get(Uri.parse(url)).then((response){

    if(response.statusCode == 200){
      dynamic decodeBody =jsonDecode(response.body);
   List jsonList = decodeBody as List;
     listState.value = jsonList
         .map((data){return PostDtoTable(id:data["id"], name:data["name"], email:data["email"]);})
         .toList();
    }else{
print("값없음");
    }
  });
} ,[]);

    return Scaffold(
      body: SafeArea(
        child:ListView(
          children: listState.value?.map((e) => ListItem(postDtoTable: e)).toList() ?? [],



        ),

      ),
    );
  }
}

class ListItem extends StatelessWidget {

  ListItem({Key? key, required this.postDtoTable}) : super(key: key);
  PostDtoTable postDtoTable;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2 , color: Colors.black)),
      child: Column(
        children: [
          Text("시원번호는 ${postDtoTable.id}"),
          Divider(),
          Text("이름: ${postDtoTable.name}"),
          Divider(),
          Text("이메일:${postDtoTable.email}")
        ],
      ),
    )
      ;
  }
}

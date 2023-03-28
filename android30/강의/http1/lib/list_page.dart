import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http1/post_dto.dart';
import 'package:http/http.dart'as http;
class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //더미데이터
    //PostDtoTable postDtoTable = PostDtoTable(userId: 0, id: 0, title: "제목");
//실제 데이터
  final listState = useState<List<PostDtoTable>?>(null);
 // final jsonState =useState<String?>(null);

useEffect((){
  String url = "https://jsonplaceholder.typicode.com/posts";
  http.get(Uri.parse(url)).then((response){
   // jsonState.value =response.body;
    if(response.statusCode == 200){
      dynamic decodeBody =jsonDecode(response.body);
   List jsonList = decodeBody as List;
     listState.value = jsonList
         .map((data){
          // return PostDtoTable(userId: data["userId"], id:  data["id"], title:  data["title"]);
           return PostDtoTable.fromjson(data);
         })
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


            //ListItem(postDtoTable: postDtoTable),


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
          Text("유저번호는 ${postDtoTable.userId}"),
          Divider(),
          Text("글번호:${postDtoTable.id}"),
          Divider(),
          Text("글번호:${postDtoTable.title}")
        ],
      ),
    )
      ;
  }
}

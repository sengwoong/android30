import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:untitled7/post_dto.dart';
import 'package:http/http.dart'as http;
import 'package:untitled7/post_repository.dart';
class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<PostDtoTable>?>(null);
    useEffect(() {
      PostRepository.instance.getDTOList().then((value){
        listState.value = value;
      });
    }, []);
// {
//   String url = "https://jsonplaceholder.typicode.com/users";
//   http.get(Uri.parse(url)).then((response){
//
//     if(response.statusCode == 200){
//       dynamic decodeBody =jsonDecode(response.body);
//       listState.value = PostDtoTable.fromJsonList(decodeBody);
//
//
//       //#########################팩토리 리스트에넣고풀기#######################
//
//       //----------------------------dto 부분----------------------------
//       // static List<PostDtoTable> fromJsonList(List jsonList){
//       //   return jsonList.map((json) => PostDtoTable.fromjson(json)).toList();
//       // }
//       //
//       // ----------------------------코드부분----------------------------
//       // listState.value = PostDtoTable.fromJsonList(decodeBody);
//       //#############################팩토리해서풀기##########################
//       //
//       //----------------------------dto부분----------------------------
//       // factory PostDtoTable.fromjson(dynamic josn)=>
//       //           PostDtoTable(id: josn["id"], name: josn["name"], email: josn["email"]);
//       //
//       //----------------------------코드부분----------------------------
//       //   List jsonList = decodeBody as List;
//       // listState.value = jsonList
//       //     .map((data){
//       //         return PostDtoTable.fromjson(data);
//       //       })
//       //      .toList();
//           //
//           //######################################그냥풀기######################################
//           //.map((data){return PostDtoTable(id:data["id"], name:data["name"], email:data["email"]);})
//           //.toList();
//     }else{
// print("값없음");
//     }
//   });

// ,[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
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

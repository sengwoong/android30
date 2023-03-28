import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class thirdPage extends StatelessWidget {
  const thirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Post> postList=[
    Post(
        userId: 0,
        id: 0,
        title: "a",
        body: "b"
    ),
    Post(
        userId: 1,
        id: 1,
        title: "a1",
        body: "b1"
    ),
    ];
    
    final changePost = (Post post){
      MainAxisAlignment.spaceBetween;
      return Row(children: [

        Text("유저번호는:${post.userId}"),
        Text("유저번호는:${post.id}"),
        Text("유저번호는:${post.title}"),
        Text("유저번호는:${post.body}"),
      ],);
    };


    return SafeArea(
    child:Column(
      children: postList.map((e)=>changePost(e)).toList(),
    )
    );
  }
}

class Post {
   int userId;
   int id;
   String title;
   String body;


//Post(this.userId, this.id, this.title,this.body);
Post({required this.userId,required this.id,required this.title,required this.body});
}


void main(){
  Post post = new Post(
    userId: 0,
    id: 0,
    title: "a",
    body: "b"
  );
}

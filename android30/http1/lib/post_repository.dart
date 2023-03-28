import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http1/post_dto.dart';
//메소드(method)는 객체(object)에 속한 함수(function)로, 클래스(class) 내부에서 정의됩니다. 인스턴스(instance)는 클래스를 통해 만들어진 객체를 의미합니다.
class PostRepository{
  //싱글톤
  static PostRepository? _instance;
  //퍼블릭 생성자 제거
  //dart에서 private은 맨 앞에 언더바를 붙인다.
  PostRepository._();

  //?? -> 대체값  // ??= -> 대입값
  static PostRepository get instance => _instance ??= PostRepository._();
//통신실패가능성

  Future<List<PostDtoTable>?> getDTOList() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PostDtoTable.fromJsonList(jsonDecode(response.body));
    } else {
      return null;
    }
  }


  }



}

}


// void main(){
//   PostRepository.instance;
//   PostRepository.instance;
//   PostRepository.instance;
// }
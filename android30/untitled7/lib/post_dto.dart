//테이블용
class PostDtoTable {
  int id;
  String name;
  String email;

  PostDtoTable({required this.id,required this.name,required this.email});

  factory PostDtoTable.fromjson(dynamic josn)=>
      PostDtoTable(id: josn["id"], name: josn["name"], email: josn["email"]);

  static List<PostDtoTable> fromJsonList(List jsonList){
    return jsonList.map((json) => PostDtoTable.fromjson(json)).toList();
  }
}

//테이블용
class PostDtoTable{
  int userId;
  int id;
  String title;

  PostDtoTable({required this.userId,required this.id,required this.title});
  //팩토리
//객체를 만들려하는데 처리가 번거러우면 타입을받아 클래스내부에서 객체를 생성해서 리턴함

factory PostDtoTable.fromjson(dynamic josn)=>
    PostDtoTable(userId: josn["userId"], id: josn["id"], title: josn["title"]);

}
//상세페이지
class PostDtoDetail{
  int userId;
  int id;
  String title;
  String body;
  PostDtoDetail({required this.userId,required this.id,required this.title,required this.body});

}
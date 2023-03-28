//테이블용
class PostDtoTable{
  int userId;
  int id;
  String title;

  PostDtoTable({required this.userId,required this.id,required this.title});
}
//상세페이지
class PostDtoDetail{
  int userId;
  int id;
  String title;
  String body;
  PostDtoDetail({required this.userId,required this.id,required this.title,required this.body});

}
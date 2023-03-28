class Cat {
  String cat_name;

  Cat(this.cat_name);

  void say() {
    print("야옹");
  }

  void cat_move(String _dogName) {
    print(_dogName + "가 짖자 " + cat_name + "가 놀랍니다.");
  }

  String _dog({required String dog_name}) {
    print(dog_name + "가 짖습니다");
    return dog_name;
  }
}

Function Func = (String data) {
  return () {
    print(data);
  };
};

void main(List<String> args) {
  Cat cat = Cat("나비");
  String dog_name = cat._dog(dog_name: "복실이");

  cat.cat_move(cat._dog(dog_name: "복실이"));

  Function result = Func("안녕");
  result();
}

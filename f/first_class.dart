//다트는 전부 1급객체

String str = "aa";
Function hello = () {
  print("object");
};
Function runFunction = (Function myFunction) {
  myFunction();
};
void main(List<String> args) {
  runFunction(() {
    print("hello");
  });
}

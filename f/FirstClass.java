// 변수할당가능 함수나 객체의 매개변수로 넘겨야함
//함수나 객체의 리턴이 가능

//void hello(){}

class FirstClass{
    public static void main(String[] args) {
        FirstClass firstClass = new FirstClass();
        firstClass.runfunctiom(new MyInterface() {

            @Override
            public void myFunction() {
               System.out.println("함수실행됌");
            }
            
        });
    }
    void hello(){
        System.out.println("hello");
    }
    //넘달떄 함수를만들고(익명) 넘긴함수를 싱행하고싶음

    void runfunctiom(MyInterface inter){
        inter.myFunction();
    }

}

interface MyInterface{
    void myFunction();

}
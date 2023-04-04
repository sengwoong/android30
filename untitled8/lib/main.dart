import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{
  await Supabase.initialize(url: "https://vmpuhitfilmaqlxxknww.supabase.co", anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtcHVoaXRmaWxtYXFseHhrbnd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA1NzIxNjcsImV4cCI6MTk5NjE0ODE2N30.Mra7ghbP3gDkBEKCqDj7LMClZr8mUSPU8Fsf6wi9idA");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //   Supabase.instance.client.from("todo").select().then((value){print(value);});

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<List<Map<String,dynamic>>>(
              stream:Supabase.instance.client.from("todo").stream(primaryKey: ["idx"]),
              builder: (context, snapshot) {
                return ListView(
                  children:snapshot.requireData.map((e) =>
                      Text(e['content'])).toList(),
                );
              }
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> number = [];

  void onClicked() {
    // ! 이 녀석은 state의 값을 바꾸는 녀석 그래서 build라는 메소드를 바뀐 state를 가지고 다시 호출해준다.
    setState(() {
      number.add(number.length);
    });

    // ! 근데 꼭 setState(() {}) 안에 변경할 state를 넣지 않아도 그냥 setState(() {})를 호출하면 결국 다시 build를 호출하는데
    // ! 가독성이 당연히 떨어지겠지 하지만 아래처럼 해도 가능은하다.
    // counter = counter + 1;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFF4EDDB),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Click count",
            style: TextStyle(fontSize: 30),
          ),
          for (var n in number) Text("$n"),
          IconButton(
              iconSize: 40,
              onPressed: onClicked,
              icon: const Icon(
                Icons.add_box_outlined,
              ))
        ]),
      ),
    ));
  }
}

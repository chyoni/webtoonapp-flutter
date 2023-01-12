# webtoonapp

- 첫번째 flutter app

### #01 Init

```bash
flutter create 'projectname'
```

우선, 플루터로 프로젝트를 생성하면 `lib/main.dart` 여기를 보면 이게 우리의 시작점이다.
main 함수에서 `runApp()` 이라는 함수를 호출하는데 이 함수가 받는 파라미터는 Widget 타입의 어떤 클래스를 말한다. 플루터에서는 모든게 다 Widget이다. Text, AppBar, Button, ... 그래서 시작점을 알리는 클래스 또한 Widget이 된다.

그리고 그 Widget class를 만드는 건 Widget 타입을 가지는 여러 Widget중 `StatelessWidget` 이 녀석을 상속받으면 가장 기본적인 Widget class를 만들 수 있다.

이 Widget class는 무조건 `build` 라는 부모의 메소드를 상속받아서 구현해야 하는데, 이 build가 곧 우리가 최초로 뿌려주는 앱의 화면이 된다. build가 return하는 Widget이 화면에서 보여지는데, return하는 값은 크게 두가지가 있다. `MaterialApp`, `CupertinoApp` MaterialApp은 based Google이고 CupertinoApp은 based Apple이다. 이 flutter 자체가 구글에서 만들었기 때문에 MaterialApp을 사용하는 것을 권장한다.

그 MaterialApp class가 받는 생성자의 파라미터 중 home 이라는 parameter가 있는데 이 녀석이 진짜로 앱을 실행시켰을 때 최초의 home화면을 말한다. 얘가 뿌려주는 각각의 appBar, body, ... 역시 모두 다 Widget이다. 즉, 모든게 Widget이다.

```dart
// main.dart

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello flutter!"),
        ),
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
```

### #02 Layout 1

### #03 Widget

`SizedBox`, `Container`, `BoxDecoration`, `Padding`, `BorderRadius`, `TextStyle`, ...

### #04 For Flutter/Dart settings.json

```json
// settings.json

// 얘는 저장하면 const로 선언해도 되는 아이는 알아서 const로 바꿔줌
"editor.codeActionsOnSave": {
    "source.fixAll": true
  },
// 얘는 트리구조로 보여줌
"dart.previewFlutterUiGuides": true,
```

### #05 My custom widget component

### #06 Transform, Offset, Icon Widget

### #07 StatelessWidget, StatefulWidget

- StatelessWidget은 State가 없는 위젯을 말하고, StatefulWidget은 State를 가지는 Widget을 말한다.
  StatefulWidget을 상속받는 AClass는 State\<AClass\> 타입의 createState() 라는 메소드를 가지는데 그 메소드는 State\<AClass\>를 상속받는 또 다른 클래스를 리턴하는데 해당 클래스는 UI를 가지며 State를 프로퍼티로 가지는 클래스다.
  그래서 기본 골격은 다음과 같다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    setState(() {
      counter = counter + 1;
    });
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
          Text(
            '$counter',
            style: const TextStyle(fontSize: 30),
          ),
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

```

### #08 setState()

- 이 녀석은 Flutter에게 State의 데이터가 변경되었음을 알려주는 메소드이다. 따라서 이 녀석이 호출되면 그 State를 가지는 클래스가 build를 다시 호출하고 다시 호출하기 때문에 새로운 state를 가지고 화면에 다시 뿌려준다.

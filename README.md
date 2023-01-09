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

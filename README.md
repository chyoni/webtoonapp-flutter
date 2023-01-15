# Flutter Tutorials

- Hello world
- UI Design
- Timer App
- `Webtoon App`

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

### #09 BuildContext

- BuildContext는 현재 클래스의 모든 상위 클래스(부모 위젯 트리)의 정보를 담고 있다.
  즉 루트로부터 쭉쭉 내려와서 어떤 특정 Text Class가 있다고 가정하면 그 Class의 build Method는 BuildContext를 파라미터로 받는데, 이 파라미터에는 해당 Text Class의 모든 상위 클래스의 정보를 담고있다.

  아래는 그 예시인데, App > MaterialApp > Scaffold > Center > Column > MyTitleText 이 위젯 트리로 되어 있다. 우리가 MaterialApp의 theme을 설정하고 그것을 MyTitleText에서 사용하려면 context를 사용하면 된다. 아래처럼 !

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
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.red),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MyTitleText(),
                ]),
          ),
        ));
  }
}

class MyTitleText extends StatelessWidget {
  const MyTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Click count",
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge?.color),
    );
  }
}

```

### #10 Flexible, Expanded Widget

### #11 Create Timer App

### #12 Timer App DONE

---

# Webtoon App

### #01 pubspec.yaml file / Future Type

- 얘는 pom.xml 파일 같이 Flutter 프로젝트의 설정 및 환경 정보를 담는 파일이라고 보면 된다. 여기서 dependecies, projectinfo, 등 많은것들을 설정할 수 있다.

```yaml
# pubspec.yaml

# 이 녀석은 Flutter에서 http request를 하기 위해 필요한 package이다.
# VSC가 좋은게 이거 그냥 붙여 넣고 저장하면 알아서 package를 다운받아 준다.
dependencies:
  http: ^0.13.5
```

- 자, 나는 http 라는 패키지를 이 플루터 프로젝트에 추가하고 request를 하기 위해서 해당 모듈을 가져다가 썼다. 그러고 코드를 보면 아래와 같다.

```dart
void getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today');
    http.get(url);
  }
```

- 여기서 get은 리턴 타입이 `Future<Reponse>` 라는 타입인데 Future는 JavaScript의 Promise와 동일하다고 생각하면 된다.
  즉, Dart도 역시 오래걸리거나 사용자의 네트워크 환경에 따라 간단하지 않고 오래 걸릴 가능성이 있는 코드를 처리할 때 그 Statement를 기다리고 나서 다음 코드가 실행이 될 필요가 있을 때 `Future<리턴타입>` 이라는 리턴 타입을 준다. 이를 처리 하기위해 async / await을 사용하는데 그 코드가 아래와 같다.

```dart

// Dart에서는 async 키워드를 함수 마지막에 쓰는것만 다르네.

void getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
```

### #02 Model, Instance, Class, API

### #03 initState()

### #04 FutureBuilder

- 애는 StatefulWidget을 사용하지 않아도 StatelessWidget으로도 데이터를 받고 받으면 로딩 상태를 바꾸고 rendering을 다시 해주는 좋은 녀석이다. 사용하는 방법은 아래와 같다.

```dart
import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon_model.dart';
import 'package:webtoonapp/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
          } else {
            return const Text("Loading...");
          }
        },
      ),
    );
  }
}

```

### #05 ListView.builder

- ListView만 사용하게 되면 child를 배열로 받고 한번에 다 렌더링하는데 이건 최적화에 좋지않다.
  그래서 ListView.builder를 사용하면 당장 화면에 보일 수 있는 것들만 가지고 화면에 뿌려주기 때문에 최적화에 적합하다.

우선 scrollDirection은 말 그대로 방향을 결정하는 거고, itemCount는 렌더링 할 전체 카운트를 던져주면 된다.
그리고 itemBuilder가 이제 실제로 렌더링할 Widget인데 여기서 item의 index를 통해서 렌더링을 한다. 화면에 다 뿌려질 정도의 개수만 한꺼번에.

```dart
return ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    var webtoon = snapshot.data![index];
    return Text(webtoon.title);
  },
);
```

### #06 ListView.seperated()

- builder는 그냥 build만 해주는거고 seperated()을 사용하면 각 아이템 사이사이에 구분자를 넣을 수 있다.
  separatorBuilder를 통해서.

```dart
return ListView.separated(
  scrollDirection: Axis.horizontal,
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    var webtoon = snapshot.data![index];
    return Text(webtoon.title);
  },
  separatorBuilder: (context, index) => const SizedBox(
    width: 20,
  ),
);
```

### #07 Webtoon List

- List를 만들고 예쁘게 정리
- 한가지 주의점은, Column의 child로 ListView를 쓸 때 unbound height error가 날 수 있는데 이 때는, Expanded를 사용해서
  List의 높이를 생성해주면 된다.

```dart
import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon_model.dart';
import 'package:webtoonapp/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                      color: Colors.black.withOpacity(0.8),
                    )
                  ]),
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}

```

### #08 Navigator

### #09 Hero

- Hero라는 Widget은 tag로 같은 녀석을 가지는 두 Widget을 생동감있게 해준다.
  예를 들어, 카드를 선택해서 Detail 화면으로 이동될 때 해당 카드가 움직여지는 생동감을 애니메이션 효과로 줄 수 있다.

### #10 Episode, Detail Model / Episode, Detail API

### #11 StatelessWidget to StatefulWidget

- 우선, 만약 API를 사용할 때 프로퍼티로 받는 id같은 것을 참조하여 API를 호출해야 하면 StatelessWidget을 사용할 수 없다.
  왜냐하면, 프로퍼티(`webtoon`)를 만들어 낼 때 다른 프로퍼티(`id`)를 참조하는것을 못하게 해놨기 때문인데 그래서 StatelessWidget에서 StatefulWidget으로 바꿔줘야 한다. 그리고 이렇게 바꾸고 나면 class가 두개로 분리가 되는데 하나는 State class고 하나는 Widget class다. 그래서 State class에서 build를 하고 initState를 하고 뭐 별걸 다 하는데 여기서 Widget class가 받는 프로퍼티 (id, title, ...)을 사용하기 위해선 `widget.id` 이런 형태로 써야한다.

### #12 Detail Screen

### #13 url_launcher

- https://pub.dev/packages/url_launcher

### #14 AppBar Icons

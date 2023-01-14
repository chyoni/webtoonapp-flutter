import 'package:http/http.dart' as http;

class ApiService {
  final String baseURL = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      return;
    }
    throw Error();
  }
}

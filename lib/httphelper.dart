import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'pizza.dart';

class HttpHelper {
  final String authority = 'kkqe9.wiremockapi.cloud'; // URL Mock API yang benar
  final String path = '/pizzalist'; // Pastikan path sesuai dengan endpoint API Anda

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final List<dynamic> jsonResponse = json.decode(result.body);
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      print('Error: ${result.statusCode}, ${result.reasonPhrase}');
      return [];
    }
  }
}

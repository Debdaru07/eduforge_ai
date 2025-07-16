import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  static const _headers = {
    'Content-Type': 'application/json',
  };

  Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(url), headers: _headers);
  }

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    return await http.post(Uri.parse(url), headers: _headers, body: jsonEncode(body));
  }

  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    return await http.put(Uri.parse(url), headers: _headers, body: jsonEncode(body));
  }

  Future<http.Response> patch(String url, Map<String, dynamic> body) async {
    return await http.patch(Uri.parse(url), headers: _headers, body: jsonEncode(body));
  }

  Future<http.Response> delete(String url) async {
    return await http.delete(Uri.parse(url), headers: _headers);
  }
}

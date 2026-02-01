import 'dart:convert';
import 'package:http/http.dart' as http;

class MongoDBService {
  static const _apiKey = '';
  static const _baseUrl =
      '';
  static const _dataSource = '';
  static const _database = '';
  static const _collection = '';

  // 모든 공지 가져오기
  static Future<List<Map<String, dynamic>>> getNotices() async {
    final res = await http.post(
      Uri.parse('$_baseUrl/action/find'),
      headers: {
        'Content-Type': 'application/json',
        'api-key': _apiKey,
      },
      body: jsonEncode({
        'dataSource': _dataSource,
        'database': _database,
        'collection': _collection,
      }),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List<Map<String, dynamic>>.from(data['documents']);
    } else {
      throw Exception('Failed to load notices: ${res.body}');
    }
  }
}

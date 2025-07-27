import 'package:http/http.dart' as http;
import 'dart:convert';

class PineconeService {
  final String apiKey = 'YOUR_PINECONE_API_KEY';
  final String baseUrl =
      'https://YOUR_INDEX-NAME-YOUR_PROJECT.svc.YOUR_ENVIRONMENT.pinecone.io';

  Future<void> upsertVector(
    String id,
    List<double> vector,
    Map<String, dynamic> metadata,
  ) async {
    final url = Uri.parse('$baseUrl/vectors/upsert');
    await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Api-Key': apiKey},
      body: jsonEncode({
        "vectors": [
          {"id": id, "values": vector, "metadata": metadata},
        ],
      }),
    );
  }

  Future<List<String>> queryVector(List<double> vector, int topK) async {
    final url = Uri.parse('$baseUrl/query');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Api-Key': apiKey},
      body: jsonEncode({
        "vector": vector,
        "topK": topK,
        "includeMetadata": true,
      }),
    );
    final data = jsonDecode(response.body);
    return (data['matches'] as List)
        .map((match) => match['metadata']['text'] as String)
        .toList();
  }
}

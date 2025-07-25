import 'package:http/http.dart' as http;
import 'dart:convert';

class GeminiService {
  final String apiKey = 'YOUR_GEMINI_API_KEY';

  Future<List<double>> getEmbedding(String text) async {
    final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:embedContent?key=$apiKey');
    final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "content": {"parts": [{"text": text}]}
      })
    );
    final data = jsonDecode(response.body);
    return List<double>.from(data['embedding']['values']);
  }

  Future<String> generateAnswer(String question, String systemInstruction, String contextText) async {
    final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=$apiKey');
    final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "system_instruction": {
          "parts": [{"text": systemInstruction}]
        },
        "contents": [
          {
            "role": "user",
            "parts": [{"text": "Context:\n$contextText\n\nQuestion:\n$question"}]
          }
        ]
      })
    );
    final data = jsonDecode(response.body);
    return data['candidates'][0]['content']['parts'][0]['text'];
  }
}

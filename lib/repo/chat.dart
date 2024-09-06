
import 'package:book_tickets/models/chat_message_model.dart';
import 'package:book_tickets/utils/constants.dart';
import 'package:dio/dio.dart';

class codeRepo {
  static Future<String> chatcodegenerationRepo(List<chatMessageModel> previosMessages) async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${Api_key}",
        data: {
          "contents": previosMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {"temperature": 0.9, "topK": 1, "topP": 1, "maxOutputTokens": 2048, "stopSequences": []},
          "safetySettings": [
            {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
            {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
            {"category": "HARM_CATEGORY_SEXUALLY_EXPLICIT", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
            {"category": "HARM_CATEGORY_DANGEROUS_CONTENT", "threshold": "BLOCK_MEDIUM_AND_ABOVE"}
          ]
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['candidates'].first['content']['parts'].first['text'];
      }
      return '';
    } catch (e) {
      print(e.toString());
      return '';
    }
  }
}

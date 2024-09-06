import 'dart:convert';

class chatMessageModel {
  final String role;
  final List<ChatPartModel> parts;

  chatMessageModel({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory chatMessageModel.fromMap(Map<String, dynamic> map) {
    return chatMessageModel(
      role: map['role'] ?? '',
      parts: List<ChatPartModel>.from(map['parts']?.map((x) => ChatPartModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory chatMessageModel.fromJson(String source) => chatMessageModel.fromMap(json.decode(source));
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }

  factory ChatPartModel.fromMap(Map<String, dynamic> map) {
    return ChatPartModel(
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatPartModel.fromJson(String source) => ChatPartModel.fromMap(json.decode(source));
}

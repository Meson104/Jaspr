import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class ChatService {
  WebSocket? _socket;

  static final _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();
  final _searchResultController = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;

  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    _socket = WebSocket(Uri.parse('ws://127.0.0.1:8000/ws/chat'));
    _socket!.messages.listen((message) {
      final data = jsonDecode(message);
      if (data['type'] == "search_result") {
        _searchResultController.add(data);
      } else if (data['type'] == "content") {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    _socket!.send(json.encode({"query": query}));
  }
}

import 'package:chat/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text('Đoạn chat'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Soạn tin nhắn mới',
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Text('ZH'),
            ),
            title: const Text('Zither Harp Astrology'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

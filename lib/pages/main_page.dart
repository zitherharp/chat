import 'package:chat/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex = ValueNotifier(0);
    return ValueListenableBuilder(
      valueListenable: selectedTabIndex,
      builder: (context, value, child) {
        return Scaffold(
          body: const [
            HomePage(),
            SizedBox.shrink(),
          ][value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value,
            onTap: (value) => selectedTabIndex.value = value,
            items: const [
              BottomNavigationBarItem(
                label: 'Đoạn chat',
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(
                label: 'Danh bạ',
                icon: Icon(Icons.group),
              ),
            ],
          ),
        );
      },
    );
  }
}

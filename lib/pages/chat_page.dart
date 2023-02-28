import 'package:chat/entities/cuu_dieu.dart';
import 'package:chat/entities/gioi_tinh.dart';
import 'package:flutter/material.dart';

class Message {
  const Message(this.id, this.content);
  final int id;
  final String content;
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var id = 1;
    final messageController = ValueNotifier(<Message>[]);
    messageController.addListener(() {
      if (id % 2 == 0) {
        final messages = messageController.value;
        final lastMessage = messages.last;
        messages.add(
          Message(
            id++,
            lastMessage.id == 1
                ? 'Bạn là nam hay nữ?'
                : lastMessage.id == 3
                    ? 'Bạn hiện bao nhiêu tuổi?'
                    : 'Sao chiếu mệnh năm nay của bạn là ${CuuDieu.coiCuuDieu(tuoi: 29, gioiTinh: GioiTinh.nam)?.name} nhé',
          ),
        );
        messageController.value = List.from(messages);
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 3,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zither Harp Astrology',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Đang hoạt động',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: messageController,
              builder: (context, value, child) {
                return value.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              radius: 64,
                              child: Text(
                                'ZH',
                                style: TextStyle(fontSize: 64),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Zither Harp Astrology',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Bạn và 4 người khác thích điều này',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text('Xem thêm'),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final message = value.elementAt(index);
                          return Align(
                            alignment: message.id % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(15.0),
                                  bottomRight: const Radius.circular(15.0),
                                  topLeft: message.id % 2 == 0 ? Radius.zero : const Radius.circular(15.0),
                                  topRight: message.id % 2 == 0 ? const Radius.circular(15.0) : Radius.zero,
                                ),
                                color: message.id % 2 == 0 ? Colors.red : Colors.blue,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(message.content),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(height: 8);
                        },
                      );
              },
            ),
          ),
          SizedBox(
            height: 72,
            child: Wrap(
              children: [
                ActionChip(
                  label: const Text('Coi sao'),
                  avatar: const Icon(Icons.star),
                  onPressed: () {},
                ),
                ActionChip(
                  label: const Text('Coi hạn'),
                  avatar: const Icon(Icons.star_purple500),
                  onPressed: () {},
                ),
                ActionChip(
                  label: const Text('Xem ngày âm lịch'),
                  avatar: const Icon(Icons.calendar_month),
                  onPressed: () {},
                ),
                ActionChip(
                  label: const Text('Coi hung niên'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        title: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
          onSubmitted: (value) {
            final messages = messageController.value;
            messages.add(Message(id++, value));
            messageController.value = List.from(messages);
          },
        ),
        leading: SizedBox(
          height: double.infinity,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ),
        trailing: SizedBox(
          height: double.infinity,
          child: IconButton(
            onPressed: () {
              final messages = messageController.value;
              messages.add(Message(id++, 'hmao'));
              messageController.value = List.from(messages);
            },
            icon: const Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _message = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
        ),
        actions: [
          Row(
            children: const [
              CircleAvatar(radius: 25, backgroundColor: Colors.blue),
              SizedBox(width: 25),
              Text('Martha', style: TextStyle(fontSize: 20)),
              SizedBox(width: 100),
              Icon(Icons.call, color: Colors.blue, size: 25),
              SizedBox(width: 20),
              Icon(Icons.video_call, color: Colors.blue, size: 25),
              SizedBox(width: 25),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          /// 🔽 Chat Content (Static + Dynamic)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Static content
                Center(
                  child: Column(
                    children: const [
                      SizedBox(height: 15),
                      CircleAvatar(radius: 50, backgroundColor: Colors.blue),
                      SizedBox(height: 10),
                      Text('Martha', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Text(
                        'Say hi to your new Friend, Martha',
                        style: TextStyle(
                          color: Color.fromARGB(255, 136, 134, 134),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('10:28'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      radius: 41.5,
                      backgroundImage: AssetImage('assets/hand.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      height: 36,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(95, 162, 160, 160),
                      ),
                      child: const Center(
                        child: Text('Hello, How are you...?'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Dynamic messages
                ..._message.map(
                  (msg) => Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(95, 162, 160, 160),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(msg),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🟩 Input box at the bottom
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    final message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      setState(() {
                        _message.add(message);
                      });
                      _messageController.clear();
                    }
                  },
                  icon: const Icon(Icons.send, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

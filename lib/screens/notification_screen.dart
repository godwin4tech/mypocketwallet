import 'package:flutter/material.dart';
import '../theme/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'Payment Received',
      'subtitle': 'You received KES 2,500 from John Doe',
      'time': '2h ago',
    },
    {
      'title': 'Withdrawal Successful',
      'subtitle': 'KES 5,000 withdrawn to your bank account',
      'time': 'Yesterday',
    },
    {
      'title': 'Recharge Successful',
      'subtitle': 'You recharged KES 1,000 to 0712345678',
      'time': 'Jan 15, 2024',
    },
  ];

  // Keep track of read notifications
  late List<bool> readStatus;

  @override
  void initState() {
    super.initState();
    // Initially, all notifications are unread
    readStatus = List<bool>.filled(notifications.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          final isRead = readStatus[index];

          return InkWell(
            onTap: () {
              setState(() {
                readStatus[index] = true; // mark as read
              });

              // Example action: show SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Opened: ${notif['title']}'),
                  duration: const Duration(seconds: 1),
                ),
              );

              // You can also navigate to detail screen here
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isRead ? Colors.grey.shade200 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notif['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isRead ? Colors.grey : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    notif['subtitle']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: isRead ? Colors.grey : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    notif['time']!,
                    style: TextStyle(
                      color: isRead ? Colors.grey : Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

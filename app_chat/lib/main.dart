import 'package:app_chat/config/theme/app_theme.dart';
import 'package:app_chat/presentation/providers/chat_provider.dart';
import 'package:app_chat/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'App Chat',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 6).theme(),
        home: const ChatScreen()
      ),
    );
  }
}
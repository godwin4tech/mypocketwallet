import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/settings_provider.dart';
import 'utils/routes.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/account_and_card_page.dart';
import 'screens/withdraw_screen.dart';
import 'screens/mobile_recharge_page.dart';
import 'screens/transfer_amount_screen.dart';
import 'screens/splash_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Pocket Wallet',
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.accountAndCards: (context) => const AccountAndCardPage(),
          AppRoutes.withdraw: (context) => const WithdrawScreen(),
          AppRoutes.mobileRecharge: (context) => const MobileRechargePage(),
          AppRoutes.transferAmount: (context) => const TransferAmountScreen(),
          AppRoutes.notifications: (context) => const NotificationScreen(),
        },
      ),
    );
  }
}

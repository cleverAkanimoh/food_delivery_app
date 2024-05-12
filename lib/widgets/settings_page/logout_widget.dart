import 'package:flutter/material.dart';
import '/services/auth/auth_service.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  void logout() {
    //  get instance of auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: logout,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "logout",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 3,
                    spreadRadius: 2,
                  )
                ]),
            child: const Icon(
              Icons.power_settings_new,
              size: 28,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}

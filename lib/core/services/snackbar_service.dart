import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

abstract class SnackBarService {
  static void showSuccessSnackBar(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return _buildSnackBar(
          message: message,
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        );
      },
      duration: const Duration(seconds: 2),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorSnackBar(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return _buildSnackBar(
          message: message,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static Widget _buildSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

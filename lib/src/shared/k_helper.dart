import 'package:flutter/material.dart';

enum SnackBarMsgType { ERROR, SUCCESS }

class KHelper {
  static void showSnackMessage(
      BuildContext context, String msg, SnackBarMsgType msgType) {
    Color color;

    if (msgType == SnackBarMsgType.ERROR) {
      color = Colors.red;
    } else if (msgType == SnackBarMsgType.SUCCESS) {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(msg),
      ),
    );
  }

  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }

  static void hideLoader(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<bool> showConfirmDialog({
    BuildContext context,
    String title,
    String content,
  }) async {
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Yes',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'No',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

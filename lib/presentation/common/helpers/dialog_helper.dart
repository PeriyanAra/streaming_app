import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

final class DialogHelper {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String buttonText,
    Widget? content,
    VoidCallback? onButtonTap,
  }) {
    final dialogHelperTheme = DialogHelperTheme.of(context);

    return showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: dialogHelperTheme.dialogInsetPadding,
          child: Container(
            width: double.infinity,
            decoration: dialogHelperTheme.dialogContentDecoration,
            padding: dialogHelperTheme.dialogContentPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: dialogHelperTheme.titleTextStyle,
                  textAlign: TextAlign.center,
                ),
                HBox(height: dialogHelperTheme.dialogContentSpace),
                if (content != null) ...{
                  content,
                  HBox(height: dialogHelperTheme.dialogContentSpace),
                },
                Align(
                  alignment: Alignment.bottomRight,
                  child: PrimaryButton(
                    onTap: onButtonTap ?? () => context.router.maybePop(),
                    text: buttonText,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

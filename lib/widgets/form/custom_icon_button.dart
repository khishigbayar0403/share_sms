import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.size,
      this.iconColor})
      : super(key: key);

  final IconData icon;
  final void Function() onTap;
  final double? size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final origSize = size ?? 48;
    return SizedBox(
        height: origSize,
        width: origSize,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onTap: onTap,
                child: Ink(
                    height: origSize - 4,
                    width: origSize - 4,
                    child: Icon(
                      icon,
                      size: origSize - 8,
                      color: iconColor,
                    ))),
          ),
        ]));
  }
}

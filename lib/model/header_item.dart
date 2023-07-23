import 'dart:html';

class HeaderItem {
  final String? title;
  final VoidCallback? onTap;
  final bool isButton;

  HeaderItem (
      {
      this.title,
      this.onTap,
      this.isButton = false,
      })
    ;
  }
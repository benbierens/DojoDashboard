import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yeet/yeet.dart';

List<Widget> getActionButtons(BuildContext context) {
  return [
    IconButton(icon: Icon(Icons.home), onPressed: () => context.yeet('/')),
    IconButton(
        icon: Icon(Icons.person), onPressed: () => context.yeet('/maze')),
    IconButton(icon: Icon(Icons.vpn_key), onPressed: () => context.yeet('/key')),
    IconButton(icon: Icon(Icons.file_copy), onPressed: () => context.yeet('/compiler'))
  ];
}

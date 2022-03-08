import 'package:flutter/material.dart';

class InkwellCustom extends StatefulWidget {
  final VoidCallback onTap;
  final Widget Function(bool isTap) child;

  const InkwellCustom({Key? key, required this.onTap, required this.child}) : super(key: key);

  @override
  State<InkwellCustom> createState() => _InkwellCustomState();
}

class _InkwellCustomState extends State<InkwellCustom> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.red.withOpacity(0.4),
        highlightColor: Colors.blue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        onTap: widget.onTap,
        child: widget.child(isTapped),
        onHighlightChanged: (isTapped) => setState(() => this.isTapped = isTapped),
        // customBorder: CustomBorder(),
      ),
    );
  }
}

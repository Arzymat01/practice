import 'package:flutter/material.dart';

class PaginationContainerWidget extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color borderColor;
  final bool isEnable;
  const PaginationContainerWidget({
    Key? key,
    required this.child,
    this.isEnable = true,
    this.onTap,
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable == true ? onTap : null,
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border:
              Border.all(color: isEnable ? borderColor : Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}

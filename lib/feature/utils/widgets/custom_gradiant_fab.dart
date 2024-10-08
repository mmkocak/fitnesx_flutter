import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomGradiantFab extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final int pageIndex;
  CustomGradiantFab(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.pageIndex})
      : super(key: key);

  @override
  State<CustomGradiantFab> createState() => _CustomGradiantFabState();
}

class _CustomGradiantFabState extends State<CustomGradiantFab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 82,
      height: 82,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: const <Color>[
              AppColors.brandColorsOne,
              AppColors.brandColorTwo,
              Colors.white,
              Colors.white
            ],
            begin:
                widget.pageIndex == 1 ? Alignment.topRight : Alignment.topRight,
            end: widget.pageIndex == 1
                ? Alignment.bottomLeft
                : Alignment.topLeft,
            stops: _getGradiantStops(widget.pageIndex),
          ),
          border: Border.all(
            color: Colors.transparent,
            width: 0.1,
          )),
      child: Container(
        height: 66,
        width: 66,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: <Color>[
                  AppColors.brandColorsOne,
                  AppColors.brandColorTwo
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              border: Border.all(color: Colors.transparent, width: 4),
            ),
            child: FloatingActionButton(
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 40,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: widget.onPressed,
              highlightElevation: 0,
              splashColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  List<double> _getGradiantStops(int pageIndex) {
    switch (pageIndex) {
      case 1:
        return [0.25, 0.25, 0.0, 0.0];
      case 2:
        return [0.25, 0.5, 0.0, 0.0];
      case 3:
        return [0.75, 0.75, 0.0, 0.0];
      case 4:
        return [1.0, 1.0, 1.0, 1.0];
      default:
        return [0.0, 0.0, 0.0, 0.0];
    }
  }
}

//
//
// import '../core.dart';
//
// class ToastService with ChangeNotifier {
//   OverlayEntry? _overlayEntry;
//
//   void showToast(BuildContext context, {required String message, required bool isError}) {
//     _overlayEntry?.remove();
//     _overlayEntry = _createOverlayEntry(context, message, isError);
//     Overlay.of(context).insert(_overlayEntry!);
//     notifyListeners();
//
//     Future.delayed(const Duration(seconds: 3)).then((_) {
//       _overlayEntry?.remove();
//       _overlayEntry = null;
//       notifyListeners();
//     });
//   }
//
//   OverlayEntry _createOverlayEntry(BuildContext context, String message, bool isError) {
//     return OverlayEntry(
//       builder: (context) => ToastWidget(
//         message: message,
//         isError: isError,
//       ),
//     );
//   }
// }
//
// class ToastWidget extends StatefulWidget {
//   final String message;
//   final bool isError;
//
//   const ToastWidget({
//     Key? key,
//     required this.message,
//     required this.isError,
//   }) : super(key: key);
//
//   @override
//   _ToastWidgetState createState() => _ToastWidgetState();
// }
//
// class _ToastWidgetState extends State<ToastWidget> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(1.0, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: SlideTransition(
//         position: _offsetAnimation,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//           color: widget.isError ? Colors.red : Colors.green,
//           child: Text(
//             widget.message,
//             style: const TextStyle(color: Colors.white, fontSize: 16.0),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class GlobalToastService extends ChangeNotifier {
//
//   static final GlobalToastService _instance = GlobalToastService._internal();
//
//   factory GlobalToastService() {
//     return _instance;
//   }
//
//   GlobalToastService._internal();
//
//   void showToast(String message, {required bool isError}) {
//     notifyListeners();
//   }
// }

import 'dart:async';

import 'package:litpad/core/core.dart';

//Todo: Fix overlay error
class ToastService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  OverlayEntry? _entry;
  Timer? _timer;

  ToastService._internal();

  static final ToastService _instance = ToastService._internal();

  factory ToastService() {
    return _instance;
  }

  /// Removes any currently displayed toast
  dismissToast() {
    debugPrint('Dismiss toast');
    _timer?.cancel();
    _timer = null;
    if (_entry != null) {
      debugPrint(' entry $_entry');

      _entry!.remove();
      _entry = null;
    }
    debugPrint('Dismiss entry $_entry');
  }

  String reformatMsg(msg) {
    return msg.toString().contains("Connection terminated during handshake")
        ? "Please check your network connectivity"
        : msg;
  }

  /// Shows Toast with provided [text]. [success] determines
  /// background color of Toast to be red [false] or green [true].
  show(String text,
      [bool success = false,
      bool loadSilently = false,
      bool titleCase = false]) {
    // dismissToast();
    if (loadSilently) {
      return null;
    } else {
        _entry = OverlayEntry(
          builder: (context) =>
              _Toast(reformatMsg(text).toUpperCase(), success, dismissToast),
        );


      NavigatorKeys.appNavigatorKey.currentState?.overlay?.insert(_entry!);

      // _timer = Timer(const Duration(seconds: 2), () {
      //   Future.delayed(const Duration(milliseconds: 360), dismissToast);
      // }
      // );
    }
 }
}

/// The actual UI for the [ToastService]
class _Toast extends StatefulWidget {
  final String text;
  final Function() dismiss;
  final bool success;
  const _Toast(this.text, this.success, this.dismiss, {Key? key})
      : super(key: key);

  @override
  State<_Toast> createState() => _ToastState();
}

class _ToastState extends State<_Toast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _slideAnimation;
  late Timer _timer;
  double _startPos = -1;
  double _endPos = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 360),
    );
    _slideAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    super.initState();

    _controller.forward();
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _startPos = 1;
        _endPos = 0;
      });
      _controller.reverse();
      _timer.cancel();
    });
  }

  @override
  void deactivate() {
    _timer.cancel();
    _controller.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewInsets.top +
          MediaQuery.of(context).viewPadding.top +
          24,
      left: 20,
      right: -5,
      // right: 24,
      child: SlideTransition(
        position: Tween(begin: Offset(_startPos, 0), end: Offset(_endPos, 0))
            .animate(_slideAnimation as Animation<double>),
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: widget.success
                  ? AppColors.green
                  : AppColors.red,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                svgHelper(
                  'assets/svgs/${widget.success ? 'check_circle_active' : 'toast_error'}.svg',
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

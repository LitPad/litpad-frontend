

import '../core.dart';

class ToastService with ChangeNotifier {
  OverlayEntry? _overlayEntry;

  void showToast(BuildContext context, {required String message, required bool isError}) {
    _overlayEntry?.remove();
    _overlayEntry = _createOverlayEntry(context, message, isError);
    Overlay.of(context).insert(_overlayEntry!);
    notifyListeners();

    Future.delayed(const Duration(seconds: 3)).then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      notifyListeners();
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context, String message, bool isError) {
    return OverlayEntry(
      builder: (context) => ToastWidget(
        message: message,
        isError: isError,
      ),
    );
  }
}

class ToastWidget extends StatefulWidget {
  final String message;
  final bool isError;

  const ToastWidget({
    Key? key,
    required this.message,
    required this.isError,
  }) : super(key: key);

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          color: widget.isError ? Colors.red : Colors.green,
          child: Text(
            widget.message,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class GlobalToastService extends ChangeNotifier {

  static final GlobalToastService _instance = GlobalToastService._internal();

  factory GlobalToastService() {
    return _instance;
  }

  GlobalToastService._internal();

  void showToast(String message, {required bool isError}) {
    notifyListeners();
  }
}

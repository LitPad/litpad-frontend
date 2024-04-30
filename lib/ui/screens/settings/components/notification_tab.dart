import 'package:litpad/core/core.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  bool _likes = false;
  bool _replies = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        YBox(widget.isMobile ? 20 : 40),
        _customNotiSwitch(
          title: "Likes",
          desc: "Notify me when someone likes my comment",
          value: _likes,
          onChanged: (v) {
            setState(() {
              _likes = v;
            });
          },
        ),
        const YBox(32),
        _customNotiSwitch(
          title: "Replies",
          desc: "Notify me when someone likes my comment",
          value: _replies,
          onChanged: (v) {
            setState(() {
              _replies = v;
            });
          },
        ),
      ],
    );
  }

  Row _customNotiSwitch({
    required String title,
    required String desc,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: widget.isMobile ? 14 : 16,
                    color: AppColors.purple900),
              ),
              YBox(widget.isMobile ? 4 : 8),
              Text(
                desc,
                style: TextStyle(
                  fontSize: widget.isMobile ? 12 : 14,
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ),
        CustomSwitch(value: value, onChanged: onChanged)
      ],
    );
  }
}

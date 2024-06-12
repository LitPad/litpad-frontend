import 'package:litpad/core/core.dart';

class CustomAccordion extends StatefulWidget {
  const CustomAccordion({
    Key? key,
    required this.title,
    required this.children,
    this.isMobile = false,
    this.onExpand,
    this.constraints,
  }) : super(key: key);

  final String title;
  final Widget children;
  final bool isMobile;
  final VoidCallback? onExpand;
  final BoxConstraints? constraints;

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (widget.onExpand != null) {
      widget.onExpand!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleExpand,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: widget.isMobile ? 12 : 18,
          horizontal: widget.isMobile ? 8 : 24,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: widget.isMobile ? 16 : 20,
                    color: AppColors.purple900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _toggleExpand,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    _isExpanded ? Icons.expand_more : Icons.chevron_right,
                    size: 24,
                    color: AppColors.grey600,
                  ),
                )
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: _isExpanded
                  ? widget.children
                  : Container(), // Use an empty Container when collapsed
            ),
          ],
        ),
      ),
    );
  }
}

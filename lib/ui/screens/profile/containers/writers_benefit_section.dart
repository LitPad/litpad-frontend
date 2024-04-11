import 'package:flutter/material.dart';
import 'package:litpad/core/utils/themes/themes.dart';
import 'package:litpad/ui/screens/about/containers/containers.dart';

class WritersBenefitSection extends StatelessWidget {
  const WritersBenefitSection({
    Key? key,
    this.constraints,
  }) : super(key: key);

  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 340,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.purple50,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 200),
                // color: Colors.yellow,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Writers Benefit',
                          style: AppTypography.text40.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      // height: 364,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 42,
                        vertical: 32,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          CustomAccordion(
                            title: "Author’s bonus",
                            children: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                // horizontal: 20,
                              ),
                              child: const Text("Author’s bonus"),
                            ),
                            onExpand: () {},
                          ),
                          const SizedBox(height: 25),
                          CustomAccordion(
                            title:
                                "Why write for LitPad: Author’s benefit on litpad",
                            constraints: constraints,
                            children: Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                  "Why write for LitPad: Author’s benefit on litpad"),
                            ),
                            onExpand: () {},
                          ),
                          const SizedBox(height: 25),
                          CustomAccordion(
                            title: "Promotion",
                            children: const Text("Promotion"),
                            onExpand: () {},
                          ),
                          const SizedBox(height: 25),
                          CustomAccordion(
                            title: "Task bonus",
                            children: const Text("Task bonus"),
                            onExpand: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class CustomAccordion extends StatefulWidget {
  const CustomAccordion({
    Key? key,
    required this.title,
    required this.children,
    this.onExpand,
    this.constraints,
  }) : super(key: key);

  final String title;
  final Widget children;
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
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 24,
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
                  style: const TextStyle(
                    fontSize: 20,
                    // fontSize: widget.constraints!.maxWidth >= 768 ? 20 : 16,
                    color: AppColors.purple900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _toggleExpand,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.expand_more,
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

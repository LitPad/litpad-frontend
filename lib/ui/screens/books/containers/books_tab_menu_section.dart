import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/books/widgets/about_book.dart';

class BooksTabMenuSection extends StatefulWidget {
  const BooksTabMenuSection({Key? key}) : super(key: key);

  @override
  State<BooksTabMenuSection> createState() => _BooksTabMenuSectionState();
}

class _BooksTabMenuSectionState extends State<BooksTabMenuSection> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              // color: AppColors.red,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey300,
                  width: 1,
                ),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    MenuTab(
                      text: 'About',
                      isActive: _selectedTabIndex == 0,
                      onTap: () => setState(() => _selectedTabIndex = 0),
                    ),
                    MenuTab(
                      text: 'Table of content',
                      isActive: _selectedTabIndex == 1,
                      onTap: () => setState(() => _selectedTabIndex = 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Visibility(
            visible: _selectedTabIndex == 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _selectedTabIndex == 0 ? 1 : 0,
              child: const AboutBook(),
            ),
          ),
          if (_selectedTabIndex == 1)
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _selectedTabIndex == 1 ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Latest release:",
                        style: AppTypography.text18.copyWith(
                          color: AppColors.grey900,
                          fontFamily: 'Inter',
                        ),
                        children: [
                          TextSpan(
                            text: " Chapter 32: The army of ghetto",
                            style: AppTypography.text18.copyWith(
                              color: AppColors.primaryPurple,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.grey300,
                            width: 1,
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                                vertical: 16,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.grey300,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Chapter 7: Anatomy of the process",
                                    style: AppTypography.text18.copyWith(
                                      color: AppColors.grey900,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Mon, December 2023",
                                    style: AppTypography.text18.copyWith(
                                      color: AppColors.grey900,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (ctx, i) => const YBox(0),
                          itemCount: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

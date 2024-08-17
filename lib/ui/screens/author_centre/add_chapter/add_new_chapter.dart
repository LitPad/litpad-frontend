import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import 'components/add_new_chapter_header.dart';

class AddNewChapter extends StatefulWidget {
  final String? bookSlug;
  const AddNewChapter({Key? key, this.bookSlug}) : super(key: key);

  @override
  State<AddNewChapter> createState() => _AddNewChapterState();
}

class _AddNewChapterState extends State<AddNewChapter> {
  bool _isBold = false;
  bool _isItalic = false;
  int _wordCount = 0;
  final AddChapterToBookVM addBookChapterVM = AddChapterToBookVM();

  @override
  void initState() {
    super.initState();
    addBookChapterVM.chapterTextC.addListener(_updateWordCount);
    addBookChapterVM.titleTextC.addListener(_updateTitle);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = addBookChapterVM.chapterTextC.text
          .split(RegExp(r'\s+'))
          .where((word) => word.isNotEmpty)
          .length;
    });
  }

  void _updateTitle() {
    setState(() {});
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }

  void showPublishDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Text('Confirm Publish',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              Divider(
                indent: 0,
                endIndent: 0,
                thickness: 0.8,
                color: Colors.grey[300],
              ),
            ],
          ),
          content: Container(
            margin: const EdgeInsets.all(15),
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name of book',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.grey600),
                ),
                Text(
                  addBookChapterVM.titleTextC.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 24),
                ),
                const YBox(15),
                const Text(
                  'Words',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.grey600),
                ),
                Text(
                  _wordCount.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 24),
                ),
                const YBox(15),
                const Text(
                  'Name of chapter',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.grey600),
                ),
                Text(
                  addBookChapterVM.titleTextC.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 24),
                ),
                Divider(
                  indent: 0,
                  endIndent: 0,
                  thickness: 0.8,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 16),
              ),
            ),
            InkWell(
              onTap: () async {
                debugPrint('Book slug--- ${widget.bookSlug}');
                addBookChapterVM.addChapterToBook(widget.bookSlug ?? '');
              },
              child: Container(
                width: 120,
                height: 43,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primaryPurple),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Publish',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 12.0, left: 12.0, right: 25.0, bottom: 10),
            child: CustomHeader(
              title: addBookChapterVM.titleTextC.text.isEmpty
                  ? 'Untitled Story'
                  : addBookChapterVM.titleTextC.text,
              onBack: () {
                Navigator.of(context).pop();
              },
              onPublish: showPublishDialog,
              onPreview: () {
                debugPrint('Preview tapped');
                if (addBookChapterVM.titleTextC.text.isNotEmpty &&
                    addBookChapterVM.chapterTextC.text.isNotEmpty) {
                  context.goNamed(RoutePath.previewChapterScreen, extra: {
                    'title': addBookChapterVM.titleTextC.text,
                    'chapterText': addBookChapterVM.chapterTextC.text,
                  });
                }
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.format_bold),
                            onPressed: () {
                              setState(() {
                                _isBold = !_isBold;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.format_italic),
                            onPressed: () {
                              setState(() {
                                _isItalic = !_isItalic;
                              });
                            },
                          ),
                          const Spacer(),
                          Text('$_wordCount words'),
                        ],
                      ),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                        thickness: 0.8,
                        color: Colors.grey[300],
                      ),
                      TextField(
                        controller: addBookChapterVM.titleTextC,
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: isDesktop ? 40 : 24,
                        ),
                      ),
                      const YBox(10),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 200, // Minimum height for the text field
                          maxHeight: MediaQuery.of(context).size.height * 0.72,
                        ),
                        child: TextField(
                          controller: addBookChapterVM.chapterTextC,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                            hintText: 'Write your story here...',
                            border: InputBorder.none,
                          ),
                          style: _getTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class PreviewScreen extends StatelessWidget {
  final String? title;
  final String? chapterText;

  const PreviewScreen({
    Key? key,
    this.title,
    this.chapterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;
    final TextStyle titleStyle =
        TextStyle(fontSize: isDesktop ? 40 : 24, fontWeight: FontWeight.bold);
    final TextStyle contentStyle = TextStyle(fontSize: isDesktop ? 20 : 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title ?? '', style: titleStyle),
            const SizedBox(height: 20),
            Text(chapterText ?? '', style: contentStyle),
          ],
        ),
      ),
    );
  }
}

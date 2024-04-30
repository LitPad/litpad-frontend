import 'package:litpad/core/core.dart';

class WalletHistoryDesktop extends StatelessWidget {
  const WalletHistoryDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.only(top: 70, left: 60),
      margin: const EdgeInsets.only(bottom: 100),
      child: const WalletHistoryBody(),
    );
  }
}

class WalletHistoryMobile extends StatelessWidget {
  const WalletHistoryMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      margin: const EdgeInsets.only(bottom: 100),
      child: const WalletHistoryBody(isMobile: true),
    );
  }
}

class WalletHistoryBody extends StatelessWidget {
  const WalletHistoryBody({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Transaction history",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.grey900,
          ),
        ),
        const YBox(20),
        Container(
          height: 426,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey300,
            ),
          ),
          child: Center(
            child: Text(
              "No transaction yet",
              style: TextStyle(
                fontSize: isMobile ? 14 : 18,
                color: AppColors.grey500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

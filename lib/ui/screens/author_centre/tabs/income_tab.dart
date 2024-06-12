import 'package:litpad/core/core.dart';

class IncomeTab extends StatelessWidget {
  const IncomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const YBox(50),
        Text(
          "Income",
          style: AppTypography.text20.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(40),
        Wrap(
          spacing: 20,
          children: List.generate(
            5,
            (index) {
              return const IncomeCard();
            },
          ),
        ),
        const YBox(50),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coin report",
                style:
                    AppTypography.text15.copyWith(fontWeight: FontWeight.w500),
              ),
              const YBox(30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RangeCard(
                    text: "All stories",
                  ),
                  Row(
                    children: [
                      Text("Date range"),
                      XBox(12),
                      RangeCard(text: '2024-03-27'),
                      XBox(12),
                      RangeCard(text: '2024-03-27'),
                    ],
                  )
                ],
              ),
              const YBox(16),
              const AppDivider(color: AppColors.grey300),
              SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(AppSvgs.coins),
                      const YBox(16),
                      const Text(
                        'You don’t have any coin report',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.grey600,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const YBox(60),
        Container(
          padding: const EdgeInsets.all(16),
          height: 400,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Withdrawal history",
                    style: AppTypography.text15
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(AppSvgs.wallet),
                      const YBox(16),
                      const Text(
                        'You don’t have any withdrawal history',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.grey600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const YBox(100)
      ],
    );
  }
}

class RangeCard extends StatelessWidget {
  const RangeCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      width: 176,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.grey300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTypography.text15,
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class IncomeCard extends StatelessWidget {
  const IncomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accumulated income",
            style: AppTypography.text16.copyWith(
              color: AppColors.grey900,
            ),
          ),
          const YBox(20),
          Text(
            "\$0.00",
            style: AppTypography.text16.copyWith(
              color: AppColors.grey900,
            ),
          )
        ],
      ),
    );
  }
}

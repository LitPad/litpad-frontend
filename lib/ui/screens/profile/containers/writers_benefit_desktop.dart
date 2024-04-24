import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/components.dart';

class WritersBenefitDeskTop extends StatelessWidget {
  const WritersBenefitDeskTop({
    Key? key,
  }) : super(key: key);

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
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Only contracted books can earn a bonus"),
                                  YBox(10),
                                  Text(
                                      "You need only 5000 words to appy for a contract"),
                                  YBox(10),
                                  Text(
                                      "LitPad offer only non-exclusive contracts for now"),
                                ],
                              ),
                            ),
                            onExpand: () {},
                          ),
                          const SizedBox(height: 25),
                          CustomAccordion(
                            title:
                                "Why write for LitPad: Author’s benefit on litpad",
                            children: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Freedom to express: Unleash your creativity without retriction"),
                                  YBox(10),
                                  Text(
                                      "Transparent compensation: Track your earnings easily"),
                                  YBox(10),
                                  Text(
                                      "Genre diversity: Share stories across various genres"),
                                  YBox(10),
                                  Text(
                                      "Engaged community: Connect with readers and fellow writers"),
                                  YBox(10),
                                  Text(
                                      "Author-centric promotions: Increase visibility for your works"),
                                  YBox(10),
                                  Text(
                                      "Gift centre: Receive appreciatiob from readers"),
                                  YBox(10),
                                  Text(
                                      "Flexible publishing: Control your publishing schedule"),
                                ],
                              ),
                            ),
                            onExpand: () {},
                          ),
                          const SizedBox(height: 25),
                          CustomAccordion(
                            title: "Promotion",
                            children: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "When the story is contracted and have hit 30k words"),
                                  YBox(10),
                                  Text("When the story have hit 50k words"),
                                  YBox(10),
                                  Text(
                                      "Other promotion follows depending on updates and performances"),
                                ],
                              ),
                            ),
                            onExpand: () {},
                          ),
                          const SizedBox(height: 25),
                          CustomAccordion(
                            title: "Task bonus",
                            children: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Get 1k veiws - Reward 200 coins"),
                                  YBox(10),
                                  Text(
                                      "Get 10k views - Reward 2,000 coins and 10 lantern"),
                                  YBox(10),
                                  Text(
                                      "First 50k views - Reward 10,000 coins and 20 lanterns"),
                                ],
                              ),
                            ),
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

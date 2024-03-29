import 'package:flutter/material.dart';
import 'package:litpad/core/utils/themes/themes.dart';

class MeetTheTeamScreen extends StatelessWidget {
  const MeetTheTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Meet the team',
              style: AppTypography.text40.copyWith(
                color: AppColors.grey900,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Container(
          //   alignment: Alignment.centerLeft,
          //   child: const TeamCard(),
          // )
          Container(
            alignment: Alignment.centerLeft,
            color: AppColors.white,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(
                8,
                (index) => const TeamCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 313,
            width: 313,
            child: Image.network(
              'https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Veces',
          style: AppTypography.text24.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Ceo',
          style: AppTypography.text20.copyWith(
            color: AppColors.grey500,
          ),
        ),
      ],
    );
  }
}

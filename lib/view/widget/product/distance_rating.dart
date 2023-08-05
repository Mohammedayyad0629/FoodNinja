import 'package:flutter/material.dart';

import '../iconsgradient.dart';

class DistanceAndRating extends StatelessWidget {
  const DistanceAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const GradientColor(
                child: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            )),
            Text(
              '3 Km',
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            const GradientColor(
                child: Icon(
              Icons.star_half,
              color: Colors.white,
            )),
            Text(
              '4.8 Rating',
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ],
    );
  }
}

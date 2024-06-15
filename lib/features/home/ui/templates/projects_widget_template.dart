import 'package:flutter/material.dart';
import 'package:portfolio/features/home/ui/molecules/rectangle_aspect_ratio_widget_molecule.dart';
import 'package:portfolio/features/home/ui/molecules/title_widget_molecule.dart';
import 'package:portfolio/ui/ui.dart';

class ProjectsWidgetTemplate extends StatelessWidget {
  const ProjectsWidgetTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.measuries.paddingExtraLarge * 3),
          child: const TitleWidgetMolecule(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: context.measuries.paddingMedium,
            left: context.measuries.paddingExtraLarge * 2.75,
            right: context.measuries.paddingMedium,
            bottom: context.measuries.paddingMedium,
          ),
          child: Row(
            children: [
              RectangleAspectRatioWidgetMolecule(
                padding: context.measuries.paddingMedium,
                imageUrl:
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-ipad-pro-202405?wid=800&hei=1000&fmt=p-jpg&qlt=95&.v=1713308272816',
              ),
              RectangleAspectRatioWidgetMolecule(
                padding: context.measuries.paddingMedium,
                imageUrl:
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-ipad-air-202405?wid=800&hei=1000&fmt=jpeg&qlt=90&.v=1713308272877',
              ),
              RectangleAspectRatioWidgetMolecule(
                padding: context.measuries.paddingMedium,
                imageUrl:
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-iphone-15-pro-202309?wid=800&hei=1000&fmt=p-jpg&qlt=95&.v=1692910040844',
              ),
              RectangleAspectRatioWidgetMolecule(
                padding: context.measuries.paddingMedium,
                imageUrl:
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-ipad-202310_GEO_BR?wid=800&hei=1000&fmt=p-jpg&qlt=95&.v=1696875323691',
              ),
              RectangleAspectRatioWidgetMolecule(
                padding: context.measuries.paddingMedium,
                imageUrl:
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-watch-s9-202309_GEO_BR?wid=800&hei=1000&fmt=jpeg&qlt=90&.v=1693501298681',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

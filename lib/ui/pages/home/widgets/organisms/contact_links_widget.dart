import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart' show BuildContextExtension;
import 'package:portfolio/ui/pages/home/widgets/widgets.dart' show InfosLinkWidget;
import 'package:portfolio/ui/ui.dart' show IconType;

class ContactLinksWidget extends StatelessWidget {
  const ContactLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InfosLinkWidget(
          iconType: IconType.profile,
          link: 'tsilvasantos38@gmail.com',
          title: 'Precisa entrar em contato?',
          textReplacement: 'Fale comigo por aqui',
        ),
        SizedBox(height: context.dimensions.paddingSmall),
        const InfosLinkWidget(
          iconType: IconType.link,
          title: 'Visite meu perfil no LinkedIn',
          link: 'https://www.linkedin.com/in/tigosante/',
        ),
      ],
    );
  }
}

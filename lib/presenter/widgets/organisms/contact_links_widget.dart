import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/presenter/presenter.dart' show IconType, InfosLinkWidget;

class ContactLinksWidget extends StatelessWidget {
  const ContactLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfosLinkWidget(
          iconType: IconType.profile,
          link: context.env.userEmail,
          title: 'Precisa entrar em contato?',
          textReplacement: 'Fale comigo por aqui',
        ),
        SizedBox(height: context.dimensions.paddingSmall),
        InfosLinkWidget(
          iconType: IconType.link,
          link: context.env.linkedInProfileUrl,
          title: 'Visite meu perfil no LinkedIn',
        ),
      ],
    );
  }
}

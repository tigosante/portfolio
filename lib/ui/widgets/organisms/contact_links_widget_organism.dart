import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show IconType, InfosLinkWidgetOrganism;

class ContactLinksWidgetOrganism extends StatelessWidget {
  const ContactLinksWidgetOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfosLinkWidgetOrganism(
          iconType: IconType.profile,
          link: context.env.userEmail,
          title: 'Precisa entrar em contato?'.translate(),
          textReplacement: 'Fale comigo por aqui'.translate(),
        ),
        SizedBox(height: context.measuries.paddingSmall),
        InfosLinkWidgetOrganism(
          iconType: IconType.link,
          link: context.env.linkedInProfileUrl,
          title: 'Visite meu perfil no LinkedIn'.translate(),
        ),
      ],
    );
  }
}

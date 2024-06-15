import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    required VoidCallback onRedirectPressed,
    super.key,
  }) : _onRedirectPressed = onRedirectPressed;

  final VoidCallback _onRedirectPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidgetAtom(
              'Página não encontrada!',
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: context.measuries.paddingLarge),
            ButtonWidgetMolecule.primary(
              label: 'Início',
              onPressed: _onRedirectPressed,
            ),
          ],
        ),
      ),
    );
  }
}

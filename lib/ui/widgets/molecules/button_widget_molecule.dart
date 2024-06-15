import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart';

enum ButtonType {
  primary,
  secondary,
  primarySmall,
  secondarySmall,
}

class ButtonWidgetMolecule extends StatefulWidget {
  const ButtonWidgetMolecule({
    required String label,
    required ButtonType type,
    required VoidCallback onPressed,
    super.key,
  })  : _type = type,
        _label = label,
        _onPressed = onPressed;

  final String _label;
  final ButtonType _type;
  final VoidCallback _onPressed;

  factory ButtonWidgetMolecule.primary({required String label, required VoidCallback onPressed}) {
    return ButtonWidgetMolecule(label: label, onPressed: onPressed, type: ButtonType.primary);
  }

  factory ButtonWidgetMolecule.secondary({required String label, required VoidCallback onPressed}) {
    return ButtonWidgetMolecule(label: label, onPressed: onPressed, type: ButtonType.secondary);
  }

  factory ButtonWidgetMolecule.primarySmall({required String label, required VoidCallback onPressed}) {
    return ButtonWidgetMolecule(label: label, onPressed: onPressed, type: ButtonType.primarySmall);
  }

  factory ButtonWidgetMolecule.secondarySmall({required String label, required VoidCallback onPressed}) {
    return ButtonWidgetMolecule(label: label, onPressed: onPressed, type: ButtonType.secondarySmall);
  }

  @override
  State<ButtonWidgetMolecule> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidgetMolecule> {
  Color get _textColor {
    return switch (widget._type) {
      ButtonType.primary || ButtonType.primarySmall => context.colorScheme.onSecondary,
      ButtonType.secondary || ButtonType.secondarySmall => context.colorScheme.primary,
    };
  }

  WidgetStateProperty<Color?>? get _backgroundColor {
    return switch (widget._type) {
      ButtonType.primary || ButtonType.primarySmall => WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return context.colorScheme.primary.withOpacity(0.9);
          }
          return context.colorScheme.primary;
        }),
      ButtonType.secondary || ButtonType.secondarySmall => null,
    };
  }

  BorderSide get _borderSide {
    return switch (widget._type) {
      ButtonType.secondary || ButtonType.secondarySmall => BorderSide(color: context.colorScheme.primary),
      _ => BorderSide.none,
    };
  }

  @override
  Widget build(BuildContext context) {
    final labelWidget = TextWidgetAtom(
      widget._label,
      style: context.textTheme.labelLarge.copyWith(color: _textColor),
    );

    if (widget._type case ButtonType.primarySmall || ButtonType.secondarySmall) {
      const normalSize = 40.0;
      return SizedBox(
        width: normalSize,
        height: normalSize,
        child: Stack(
          children: [
            TextButton(
              onPressed: widget._onPressed,
              style: ButtonStyle(
                backgroundColor: _backgroundColor,
                fixedSize: WidgetStateProperty.all(const Size(normalSize, normalSize)),
              ),
              child: labelWidget,
            ),
          ],
        ),
      );
    }

    return _ButtonAnimatedWidget(
      hoverSize: const Size(360, 50),
      normalSize: const Size(350, 50),
      child: TextButton(
        onPressed: widget._onPressed,
        style: ButtonStyle(
          backgroundColor: _backgroundColor,
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shadowColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.hovered) ? context.colorScheme.primary : context.colorScheme.transparent;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: _borderSide,
              borderRadius: BorderRadius.circular(context.measuries.borderRadiusMedium),
            ),
          ),
        ),
        child: labelWidget,
      ),
    );
  }
}

class _ButtonAnimatedWidget extends StatefulWidget {
  const _ButtonAnimatedWidget({
    required Size hoverSize,
    required Size normalSize,
    required Widget child,
  })  : _hoverSize = hoverSize,
        _normalSize = normalSize,
        _child = child;

  final Size _hoverSize;
  final Size _normalSize;
  final Widget _child;

  @override
  State<_ButtonAnimatedWidget> createState() => __ButtonAnimatedWidgetState();
}

class __ButtonAnimatedWidgetState extends State<_ButtonAnimatedWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _isHovered ? widget._hoverSize.width : widget._normalSize.width,
        height: _isHovered ? widget._hoverSize.height : widget._normalSize.height,
        child: widget._child,
      ),
    );
  }
}

import 'package:flutter/material.dart' show BuildContext, TextStyle;
import 'package:portfolio/extensions/extensions.dart' show BuildContextExtension;

enum AppTextTypeEnum {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelSmall;

  TextStyle getStyle(BuildContext context) {
    return switch (this) {
      AppTextTypeEnum.displayLarge => context.textTheme.displayLarge,
      AppTextTypeEnum.displayMedium => context.textTheme.displayMedium,
      AppTextTypeEnum.displaySmall => context.textTheme.displaySmall,
      AppTextTypeEnum.headlineMedium => context.textTheme.headlineMedium,
      AppTextTypeEnum.headlineSmall => context.textTheme.headlineSmall,
      AppTextTypeEnum.titleLarge => context.textTheme.titleLarge,
      AppTextTypeEnum.titleMedium => context.textTheme.titleMedium,
      AppTextTypeEnum.titleSmall => context.textTheme.titleSmall,
      AppTextTypeEnum.bodyLarge => context.textTheme.bodyLarge,
      AppTextTypeEnum.bodyMedium => context.textTheme.bodyMedium,
      AppTextTypeEnum.bodySmall => context.textTheme.bodySmall,
      AppTextTypeEnum.labelLarge => context.textTheme.labelLarge,
      AppTextTypeEnum.labelSmall => context.textTheme.labelSmall,
    };
  }
}

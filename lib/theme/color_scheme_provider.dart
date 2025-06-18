import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ColorSchemeState を管理する Notifier
class ColorSchemeNotifier extends Notifier<ColorScheme> {
  @override
  ColorScheme build() => _defaultScheme;

  static final _defaultScheme = const ColorScheme.light(
    primary: Colors.orange,
    onPrimary: Colors.white,
    // floatingActionButtonのColor
    primaryContainer: Colors.teal,
    secondary: Colors.blue,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    // OutlineButtonのborderColor,
    outline: Colors.orange,
    // Divider, tabBarのdividerColor
    outlineVariant: Colors.pinkAccent,
  );

  void update({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? surface,
    Color? onSurface,
    Color? outline,
    Color? outlineVariant,
  }) {
    state = state.copyWith(
      primary: primary ?? state.primary,
      onPrimary: onPrimary ?? state.onPrimary,
      primaryContainer: primaryContainer ?? state.primaryContainer,
      secondary: secondary ?? state.secondary,
      onSecondary: onSecondary ?? state.onSecondary,
      error: error ?? state.error,
      onError: onError ?? state.onError,
      surface: surface ?? state.surface,
      onSurface: onSurface ?? state.onSurface,
      outline: outline ?? state.outline,
      outlineVariant: outlineVariant ?? state.outlineVariant,
    );
  }
}

final colorSchemeProvider = NotifierProvider<ColorSchemeNotifier, ColorScheme>(
  () => ColorSchemeNotifier(),
  name: 'colorSchemeProvider',
);

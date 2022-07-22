import 'package:flutter/material.dart';
import 'sample_button.dart';

Widget primary() => Button(
  'Hola', ButtonStyles.primary);

Widget secondary() => Button(
  'Button', ButtonStyles.secondary);

Widget disabled() => Button(
  'Button', ButtonStyles.disabled);

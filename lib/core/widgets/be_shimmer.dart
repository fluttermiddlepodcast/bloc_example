import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:technical_debt/technical_debt/severity.dart';
import 'package:technical_debt/technical_debt/technical_debt.dart';

@TechnicalDebt(
  author: 'fluttermiddlepodcast',
  description: 'Move to UI-Kit',
  severity: Severity.minor,
  deadline: '2025-12-12',
)
class BEShimmer extends StatelessWidget {
  final double height;
  final double width;

  const BEShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: SizedBox(height: height, width: width, child: const ColoredBox(color: Colors.white)),
    );
  }
}

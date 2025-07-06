import 'package:dio/dio.dart';
import 'package:technical_debt/technical_debt/severity.dart';
import 'package:technical_debt/technical_debt/technical_debt.dart';

@TechnicalDebt(
  author: 'fluttermiddlepodcast',
  description: 'Move to DI',
  severity: Severity.major,
  deadline: '2025-12-12',
)
final dio = Dio(
  BaseOptions(
    baseUrl: 'https://randomuser.me/api/',
  ),
);

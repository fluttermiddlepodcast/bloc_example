import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';
import 'package:bloc_rules_plugin/bloc_builder_build_when_lint_rule.dart';

final plugin = BlocRulesPlugin();

class BlocRulesPlugin extends Plugin {
  @override
  void register(PluginRegistry registry) {
    registry.registerWarningRule(BlocBuilderBuildWhenLintRule());
  }

  @override
  String get name => 'BlocRulesPlugin';
}

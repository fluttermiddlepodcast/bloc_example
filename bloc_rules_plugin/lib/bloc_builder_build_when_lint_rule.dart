import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart';

class BlocBuilderBuildWhenLintRule extends AnalysisRule {
  BlocBuilderBuildWhenLintRule()
    : super(
        name: 'bloc_builder_build_when_lint_rule',
        description: 'Missing buildWhen in BlocBuilder',
      );

  @override
  void registerNodeProcessors(RuleVisitorRegistry registry, RuleContext context) {
    registry.addInstanceCreationExpression(
      this,
      _BlocBuilderBuildWhenLintRuleNewVisitor(
        rule: this,
      ),
    );
  }

  @override
  DiagnosticCode get diagnosticCode => LintCode(
    name,
    description,
    severity: DiagnosticSeverity.ERROR,
  );
}

class _BlocBuilderBuildWhenLintRuleNewVisitor extends SimpleAstVisitor<void> {
  final AnalysisRule rule;

  _BlocBuilderBuildWhenLintRuleNewVisitor({
    required this.rule,
  });

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    final element = node.constructorName.type.element;

    if (element == null || element.name != 'BlocBuilder') {
      return;
    }

    final hasBuildWhen = node.argumentList.arguments.any(
      (arg) => arg is NamedExpression && arg.name.label.name == 'buildWhen',
    );

    if (!hasBuildWhen) {
      rule.reportAtNode(node);
    }
  }
}

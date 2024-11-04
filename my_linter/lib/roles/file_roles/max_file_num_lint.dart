import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class MaxFileNumLint extends DartLintRule {
  MaxFileNumLint() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const _code = LintCode(
    name: 'max length file',
    problemMessage: 'you reach max file length',
  );

  @override
  void run(CustomLintResolver resolver, ErrorReporter reporter,
      CustomLintContext context) {
    if (resolver.lineInfo.lineCount > 30) {
      final lengthOfFile = resolver.lineInfo.getOffsetOfLineAfter(resolver.lineInfo.lineCount - 1);

      reporter.atOffset(
        offset: 0,
        length: lengthOfFile,
        errorCode: _code,
      );
    }
  }
}

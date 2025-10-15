import 'dart:io';
import 'package:book_stack_design_system/designs/utils/logger.dart';

void main(List<String> args) async {
  double? manualCoverage;
  if (args.isNotEmpty) {
    manualCoverage = double.tryParse(args[0]);
    if (manualCoverage == null) {
      BookStackLogger.error('❌ Invalid percentage value: ${args[0]}');
      exit(1);
    }
    BookStackLogger.info('🏷️ Generating manual coverage badge for $manualCoverage%...');
  }

  double coverage;

  if (manualCoverage != null) {
    coverage = manualCoverage;
  } else {
    // Fallback: read from lcov.info
    final File coverageFile = File('coverage/lcov.info');
    if (!coverageFile.existsSync()) {
      BookStackLogger.error(
        '❌ coverage/lcov.info not found. Run `flutter test --coverage` first.',
      );
      exit(1);
    }

    final List<String> lines = await coverageFile.readAsLines();
    int totalLines = 0;
    int coveredLines = 0;

    for (final String line in lines) {
      if (line.startsWith('DA:')) {
        totalLines++;
        if (line.endsWith(',1')) {
          coveredLines++;
        }
      }
    }

    if (totalLines == 0) {
      BookStackLogger.error('❌ No coverage data found.');
      exit(1);
    }

    coverage = coveredLines / totalLines * 100;
  }

  final String color = _getColor(coverage);

  final String svg = '''
<svg xmlns="http://www.w3.org/2000/svg" width="110" height="20">
  <linearGradient id="b" x2="0" y2="100%">
    <stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
    <stop offset="1" stop-opacity=".1"/>
  </linearGradient>
  <rect rx="3" width="110" height="20" fill="#555"/>
  <rect rx="3" x="60" width="50" height="20" fill="$color"/>
  <path fill="$color" d="M60 0h4v20h-4z"/>
  <rect rx="3" width="110" height="20" fill="url(#b)"/>
  <g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="11">
    <text x="30" y="15" fill="#010101" fill-opacity=".3">coverage</text>
    <text x="30" y="14">coverage</text>
    <text x="85" y="15" fill="#010101" fill-opacity=".3">${coverage.toStringAsFixed(1)}%</text>
    <text x="85" y="14">${coverage.toStringAsFixed(1)}%</text>
  </g>
</svg>
''';

  final File outFile = File('coverage_badge.svg');
  await outFile.writeAsString(svg);
  BookStackLogger.info('🏷️ Badge generated: coverage_badge.svg');
}

String _getColor(double coverage) {
  if (coverage >= 90) {
    return '#4c1'; // green
  }
  if (coverage >= 75) {
    return '#97CA00'; // yellow-green
  }
  if (coverage >= 50) {
    return '#dfb317'; // yellow
  }
  if (coverage >= 25) {
    return '#fe7d37'; // orange
  }
  return '#e05d44'; // red
}

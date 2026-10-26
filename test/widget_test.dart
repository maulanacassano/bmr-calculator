// widget_test.dart
//
// Unit test untuk logika perhitungan BMR (class Calculator) dan
// smoke test widget untuk memastikan aplikasi dapat dibuka.

import 'package:flutter_test/flutter_test.dart';

import 'package:bmr/calculator.dart';
import 'package:bmr/constants.dart';
import 'package:bmr/main.dart';

void main() {
  test('Mifflin-St Jeor pria 25 th, 180 cm, 60 kg = 1605', () {
    // 10*60 + 6.25*180 - 5*25 + 5 = 1605
    final cal = Calculator(
      height: 180,
      weight: 60,
      age: 25,
      gender: Gender.male,
      formula: BmrFormula.mifflinStJeor,
    );
    expect(cal.calculateBMR(), '1605');
  });

  test('Mifflin-St Jeor wanita 25 th, 165 cm, 60 kg = 1345', () {
    // 10*60 + 6.25*165 - 5*25 - 161 = 1345.25
    final cal = Calculator(
      height: 165,
      weight: 60,
      age: 25,
      gender: Gender.female,
      formula: BmrFormula.mifflinStJeor,
    );
    expect(cal.calculateBMR(), '1345');
  });

  test('Harris-Benedict pria 25 th, 180 cm, 60 kg', () {
    // 88.362 + 13.397*60 + 4.799*180 - 5.677*25 = 1614.077
    final cal = Calculator(
      height: 180,
      weight: 60,
      age: 25,
      gender: Gender.male,
      formula: BmrFormula.harrisBenedict,
    );
    expect(cal.calculateBMR(), '1614');
  });

  test('Kebutuhan kalori harian = BMR x pengali aktivitas', () {
    final cal = Calculator(
      height: 180,
      weight: 60,
      age: 25,
      gender: Gender.male,
      formula: BmrFormula.mifflinStJeor,
    );
    cal.calculateBMR();
    final daily = cal.getDailyCalories();
    expect(daily.length, activityLevels.length);
    expect(daily.values.first, (1605 * 1.2).round());
  });

  testWidgets('Halaman input tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('BMR CALCULATOR'), findsOneWidget);
    expect(find.text('CALCULATE'), findsOneWidget);
  });
}

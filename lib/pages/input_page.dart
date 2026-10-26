// input_page.dart
//
// Halaman pertama: pengguna memasukkan data (gender, tinggi, berat, usia,
// dan rumus BMR). Halaman ini StatefulWidget karena nilai input berubah-ubah
// dan layar harus digambar ulang setiap kali nilainya berubah (setState).
//
// Alur halaman:
//   1. Pengguna memilih gender  -> selectedGender berubah
//   2. Menggeser slider tinggi  -> height berubah
//   3. Menekan +/- pada berat dan usia -> weight / age berubah
//   4. Memilih rumus (Mifflin-St Jeor / Harris-Benedict) -> selectedFormula
//   5. Menekan CALCULATE -> hitung BMR lewat class Calculator, lalu
//      pindah ke ResultPage sambil membawa hasilnya.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmr/components/custom_card.dart';
import 'package:bmr/components/icon_card.dart';
import 'package:bmr/constants.dart';
import 'result_page.dart';
import 'package:bmr/components/bottom_button.dart';
import 'package:bmr/components/round_icon_button.dart';
import 'package:bmr/calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State (data yang bisa berubah) beserta nilai awalnya.
  Gender selectedGender = Gender.male;
  BmrFormula selectedFormula = BmrFormula.mifflinStJeor;
  int height = 160; // cm
  int weight = 60; // kg
  int age = 20; // tahun

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ---------- Baris 1: pilihan gender ----------
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    // Kartu terpilih berwarna aktif, yang lain redup.
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars,
                      caption: 'MALE',
                    ),
                    onPress: () {
                      // setState memberi tahu Flutter agar menggambar ulang UI.
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus,
                      caption: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // ---------- Baris 2: slider tinggi badan ----------
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  // SliderTheme dipakai untuk mengatur warna & bentuk slider.
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // Dipanggil setiap slider digeser; simpan nilai bulat.
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---------- Baris 3: berat badan & usia ----------
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT (kg)',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  // Batas bawah 30 kg agar nilai tetap wajar.
                                  if (weight > 30) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE (years)',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  // Batas bawah usia 15 tahun.
                                  if (age > 15) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  // Batas atas usia 100 tahun.
                                  if (age < 100) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ---------- Baris 4: pilihan rumus BMR ----------
          // Tinggi tetap (bukan Expanded) supaya tidak menekan kartu lain.
          SizedBox(
            height: 75.0,
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedFormula == BmrFormula.mifflinStJeor
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: Center(
                      child: Text(
                        formulaName(BmrFormula.mifflinStJeor),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    onPress: () {
                      setState(() {
                        selectedFormula = BmrFormula.mifflinStJeor;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedFormula == BmrFormula.harrisBenedict
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: Center(
                      child: Text(
                        formulaName(BmrFormula.harrisBenedict),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    onPress: () {
                      setState(() {
                        selectedFormula = BmrFormula.harrisBenedict;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // ---------- Tombol CALCULATE ----------
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // 1) Buat objek Calculator berisi seluruh input pengguna.
              Calculator cal = Calculator(
                height: height,
                weight: weight,
                age: age,
                gender: selectedGender,
                formula: selectedFormula,
              );
              // 2) Hitung BMR dulu; method lain bergantung pada nilai ini.
              String bmr = cal.calculateBMR();
              String result = cal.getResult();
              String information = cal.getInterpretation();
              Map<String, int> dailyCalories = cal.getDailyCalories();
              // 3) Pindah ke ResultPage sambil mengirim data hasil lewat constructor.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: result,
                    bmr: bmr,
                    information: information,
                    dailyCalories: dailyCalories,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

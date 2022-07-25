import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider and Cheks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue,
            onChanged: _sliderEnabled
                ? (value) => setState(() {
                      _sliderValue = value;
                    })
                : null,
          ),
          CheckboxListTile(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: (value) => setState(() {
              _sliderEnabled = value ?? true;
            }),
          ),
          SwitchListTile.adaptive(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: (value) => setState(() {
              _sliderEnabled = value;
            }),
          ),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    "https://cdn.pixabay.com/photo/2020/07/06/17/51/batman-5377804_1280.png"),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          )
        ],
      ),
    );
  }
}

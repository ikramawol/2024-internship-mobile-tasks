import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 100,
            divisions: 10,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
            activeColor: const Color(0xFF3E50F3),
            inactiveColor: const Color(0xFFD9D9D9),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
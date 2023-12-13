import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ImageColorPicker extends StatefulWidget {
  const ImageColorPicker({Key? key}) : super(key: key);

  @override
  _ImageColorPickerState createState() => _ImageColorPickerState();
}

class _ImageColorPickerState extends State<ImageColorPicker> {
  Color selectedColor = Colors.white; // Default color
  Image image =
      Image.asset('assets/images/i1.jpg'); // Replace with your image path
  final colorhistory = [
    Colors.red,
    Colors.amber,
    Colors.teal,
    Colors.blueGrey,
    Colors.indigo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(selectedColor, BlendMode.modulate),
                  child: image,
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.start,
                  'Corporate Communication: This encompasses how a corporation communicates internally among its employees and externally with stakeholders, customers, and the public.',
                  style: TextStyle(
                    fontFamily: 'Nexa', // Choose a suitable font family
                    fontSize: 16.0, // Adjust the font size as needed
                    fontWeight:
                        FontWeight.normal, // Use FontWeight.bold for bold text
                    color: Colors.black87, // Choose a suitable text color
                  ),
                ),
                const SizedBox(height: 30),
                _buildColorPicker(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple, // Background color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Pick Color'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    ColorPicker(
                      pickerColor: selectedColor,
                      onColorChanged: (color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      colorPickerWidth: 300.0,
                      pickerAreaHeightPercent: 0.7,
                      enableAlpha: false,
                      colorHistory: colorhistory,
                      onHistoryChanged: (value) {},
                      displayThumbColor: true,
                      labelTypes: [
                        ColorLabelType.hex,
                        ColorLabelType.rgb,
                        ColorLabelType.hsl
                      ],
                      paletteType: PaletteType.rgbWithBlue,
                      pickerAreaBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(2.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.deepOrange,
                        child: const Text(
                          'Select Color',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Text(
        'Pick Color',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

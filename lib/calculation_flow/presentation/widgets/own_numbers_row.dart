import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';
import 'package:search_calculate/core/widgets/text/heading_3.dart';
import 'package:search_calculate/core/widgets/text/heading_4.dart';

class OwnNumbersRow extends StatefulWidget {
  final String title;
  final TextInputType keyboardType;
  final String? initialValue;
  final Function(String) onChanged;

  const OwnNumbersRow({
    Key? key,
    required this.title,
    required this.onChanged,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    this.initialValue,
  }) : super(key: key);

  @override
  _OwnNumbersRowState createState() => _OwnNumbersRowState();
}

class _OwnNumbersRowState extends State<OwnNumbersRow> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Heading3(widget.title),
        VerticalSpacing(12),
        CustomTextField(
          keyboardType: widget.keyboardType,
          controller: textEditingController,
          textAlign: TextAlign.left,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

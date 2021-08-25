import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/buttons/custom_back_button.dart';
import 'package:search_calculate/core/widgets/buttons/custom_full_button.dart';
import 'package:search_calculate/core/widgets/buttons/custom_text_button.dart';
import 'package:search_calculate/core/widgets/custom_step_indicator.dart';
import 'package:search_calculate/core/widgets/custom_switch.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';
import 'package:search_calculate/core/widgets/icons/small_icon_button.dart';
import 'package:search_calculate/core/widgets/tags.dart';
import 'package:search_calculate/home/presentation/pages/home_page.dart';
import 'package:search_calculate/get_it.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S&C',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CustomSwitch(
                value: value,
                onChanged: (b) {
                  setState(() {
                    value = b;
                  });
                },
              ),
            ),
            VerticalSpacing(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomBackButton(
                    onPressed: () {},
                  ),
                  Expanded(
                    child: CustomStepIndicator(
                      totalSteps: 3,
                      completedSteps: 1,
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      suffixText: '%',
                    ),
                  ),
                  HorizontalSpacing(8),
                  SmallIconButton(
                    icon: Icon(
                      Icons.clear,
                      color: red,
                      size: 18,
                    ),
                    destructive: true,
                  ),
                ],
              ),
            ),
            VerticalSpacing(),
            Center(
              child: CustomTextButton(
                text: '+ Add 5 more years',
                onPressed: () {},
              ),
            ),
            VerticalSpacing(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CustomFullButton(
                  title: 'Next',
                  icon: Image.asset(
                    'assets/icons/send.png',
                    width: 16,
                    height: 16,
                  ),
                  addBorderRadiusToBottom: false,
                  onPressed: () {},
                ),
              ),
            ),
            VerticalSpacing(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tags(tags: ['AAPL', 'USD', 'USA', 'NASDAQ']),
            ),
            VerticalSpacing(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                backgroundColor: extraLightGray,
                prefix: Icon(
                  Icons.search,
                  color: gray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

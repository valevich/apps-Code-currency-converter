import 'package:flutter/material.dart';
import '../views/cc_row_buttons.dart';
import '../views/cc_Info_page.dart';
import '../views/cc_converter_page.dart';

class CurrencyHomeScreen extends StatefulWidget {
  @override
  _CurrencyHomeScreenState createState() => _CurrencyHomeScreenState();
}

class _CurrencyHomeScreenState extends State<CurrencyHomeScreen> {
  int _pageIndexHolder = 0;

  List<Widget> _listPages = [ConverterPage(), InfoPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            RowButtons(
              onSave: (pageIndexValue) {
                if (mounted)
                  setState(() {
                    _pageIndexHolder = pageIndexValue;
                  });
              },
              activePageIndex: _pageIndexHolder,
            ),
            Expanded(
              child: _listPages[_pageIndexHolder],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/currency.dart';
import '../models/currency_service.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  late TextEditingController _amountController;
  String _selectedFromCurrency = 'IDR';
  String _selectedToCurrency = 'USD';
  double _result = 0.0;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konversi Mata Uang',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: const Color.fromARGB(255, 114, 174, 209),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: _selectedFromCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedFromCurrency = newValue!;
                      });
                    },
                    isExpanded: true,
                    itemHeight: 80,
                    items: CurrencyService.currencies
                        .map<DropdownMenuItem<String>>((Currency currency) {
                      return DropdownMenuItem<String>(
                        value: currency.code,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(currency.name, style: GoogleFonts.poppins()),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Icon(Icons.arrow_forward),
                Flexible(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: _selectedToCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedToCurrency = newValue!;
                      });
                    },
                    isExpanded: true,
                    itemHeight: 80,
                    items: CurrencyService.currencies
                        .map<DropdownMenuItem<String>>((Currency currency) {
                      return DropdownMenuItem<String>(
                        value: currency.code,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(currency.name, style: GoogleFonts.poppins()),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {
                if (_amountController.text.isNotEmpty) {
                  double amount = double.parse(_amountController.text);
                  Currency fromCurrency = CurrencyService.currencies.firstWhere(
                        (currency) => currency.code == _selectedFromCurrency,
                  );
                  Currency toCurrency = CurrencyService.currencies.firstWhere(
                        (currency) => currency.code == _selectedToCurrency,
                  );
                  _result = amount * (toCurrency.exchangeRate / fromCurrency.exchangeRate);
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Convert', style: GoogleFonts.poppins()),
            ),
            const SizedBox(height: 20.0),
            Text(
              _result != 0.0
                  ? '${_amountController.text} $_selectedFromCurrency is ${_result.toStringAsFixed(2)} $_selectedToCurrency'
                  : '',
              style: GoogleFonts.poppins(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

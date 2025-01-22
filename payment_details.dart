import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_page.dart'; // Import MainPage

class PaymentFormPage extends StatefulWidget {
  const PaymentFormPage({super.key});

  @override
  _PaymentFormPageState createState() => _PaymentFormPageState();
}

class _PaymentFormPageState extends State<PaymentFormPage> {
  final List<String> _countries = [
    'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Argentina', 'Armenia', 'Australia',
    'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium',
    'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso',
    'Burundi', 'Canada', 'China', 'Colombia', 'Czech Republic', 'Denmark', 'Egypt', 'France', 'Germany',
    'Greece', 'India', 'Italy', 'Japan', 'Kenya', 'Mexico', 'Nepal', 'Netherlands', 'Nigeria',
    'Norway', 'Pakistan', 'Philippines', 'Poland', 'Portugal', 'Russia', 'Saudi Arabia', 'Singapore',
    'South Africa', 'South Korea', 'Spain', 'Sri Lanka', 'Sweden', 'Switzerland', 'Thailand',
    'Turkey', 'United Arab Emirates', 'United Kingdom', 'United States', 'Vietnam', 'Zimbabwe'
  ];

  String? _selectedCountry;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _creditCardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment Submitted Successfully!')),
      );

      // Navigate to MainPage after payment confirmation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 208, 165),
        title: const Text('Secure Payment Form'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                          child: Image.asset(
                            'assets/card_image.png',
                            height: 120,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Payment Details:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$');
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Country',
                                  border: OutlineInputBorder(),
                                ),
                                value: _selectedCountry,
                                items: _countries.map((String country) {
                                  return DropdownMenuItem<String>(
                                    value: country,
                                    child: Text(country),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCountry = newValue;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select a country';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                controller: _postalCodeController,
                                decoration: const InputDecoration(
                                  labelText: 'Postal Code',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a postal code';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _creditCardController,
                          decoration: const InputDecoration(
                            labelText: 'Credit Card Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your credit card number';
                            }
                            if (value.length != 16) {
                              return 'Credit card number must be 16 digits';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _expiryController,
                                decoration: const InputDecoration(
                                  labelText: 'MM/YY',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the expiry date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: _cvvController,
                                decoration: const InputDecoration(
                                  labelText: 'CVV',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the CVV';
                                  }
                                  if (value.length != 3) {
                                    return 'CVV must be 3 digits';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 231, 208, 165),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: _submitPayment,
                          child: const Text(
                            'CONFIRM PAYMENT',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 101, 67, 33),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

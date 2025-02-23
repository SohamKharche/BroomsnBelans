import 'package:brooms_n_belans/Components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OneoffBook extends StatefulWidget {
  const OneoffBook({super.key});

  @override
  State<OneoffBook> createState() => _OneoffBookState();
}

class _OneoffBookState extends State<OneoffBook> {
  final _formKey = GlobalKey<FormState>();
  String? _serviceType; // Maid or Cook
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int? _selectedOption;
  final TextEditingController _addressController = TextEditingController();

  // Helper to open DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Helper to open TimePicker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AbelCustom(
          text: "Oneoff Booking",
          size: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Color(0xffD90000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Maid/Cook (Dropdown)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Service Type'),
                items: ['Maid', 'Cook']
                    .map((service) => DropdownMenuItem(
                          value: service,
                          child: Text(service),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _serviceType = value;
                    _selectedOption = null; // Reset the conditional field
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a service type' : null,
              ),
              const SizedBox(height: 16.0),

              // 2. Date of Service (Date)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date of Service'),
                readOnly: true,
                onTap: () => _selectDate(context),
                controller: TextEditingController(
                  text: _selectedDate == null
                      ? ''
                      : DateFormat.yMd().format(_selectedDate!),
                ),
                validator: (value) =>
                    _selectedDate == null ? 'Please select a date' : null,
              ),
              const SizedBox(height: 16.0),

              // 3. Preferred Time (Clock)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Preferred Time'),
                readOnly: true,
                onTap: () => _selectTime(context),
                controller: TextEditingController(
                  text: _selectedTime == null
                      ? ''
                      : _selectedTime!.format(context),
                ),
                validator: (value) =>
                    _selectedTime == null ? 'Please select a time' : null,
              ),
              const SizedBox(height: 16.0),

              // 4. No of people (If cook) or No of rooms (If maid) (Dropdown)
              if (_serviceType != null)
                DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    labelText: _serviceType == 'Cook'
                        ? 'Number of People'
                        : 'Number of Rooms',
                  ),
                  items: List.generate(10, (index) => index + 1)
                      .map((number) => DropdownMenuItem(
                            value: number,
                            child: Text(number.toString()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                  validator: (value) => value == null
                      ? 'Please select a ${_serviceType == 'Cook' ? 'number of people' : 'number of rooms'}'
                      : null,
                ),
              const SizedBox(height: 16.0),

              // 5. Address (Text)
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an address' : null,
              ),
              const SizedBox(height: 32.0),

              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Booking Confirmed')),
                      );
                    }
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }
}

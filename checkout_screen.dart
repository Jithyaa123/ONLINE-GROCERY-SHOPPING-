import 'package:flutter/material.dart';
import '../cart_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  String _payment = 'Cash on Delivery';

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    super.dispose();
  }

  Future<void> _placeOrder() async {
    if (!_formKey.currentState!.validate()) return;
    final total = cart.total;
    cart.clear();
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Order placed 🎉'),
        content: Text(
            'Thanks ${_name.text.trim()}! Your order of ₹${total.toStringAsFixed(0)} '
            'will be delivered soon.\nPayment: $_payment'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                  labelText: 'Full name', border: OutlineInputBorder()),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Enter your name' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: 'Phone number', border: OutlineInputBorder()),
              validator: (v) => (v == null || v.trim().length < 10)
                  ? 'Enter a valid phone number'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _address,
              maxLines: 3,
              decoration: const InputDecoration(
                  labelText: 'Delivery address', border: OutlineInputBorder()),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Enter your address' : null,
            ),
            const SizedBox(height: 16),
            const Text('Payment method',
                style: TextStyle(fontWeight: FontWeight.w600)),
            for (final m in ['Cash on Delivery', 'UPI', 'Card'])
              RadioListTile<String>(
                title: Text(m),
                value: m,
                groupValue: _payment,
                onChanged: (v) => setState(() => _payment = v!),
              ),
            const SizedBox(height: 8),
            Text('Amount to pay: ₹${cart.total.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            FilledButton(
                onPressed: _placeOrder, child: const Text('Place order')),
          ],
        ),
      ),
    );
  }
}

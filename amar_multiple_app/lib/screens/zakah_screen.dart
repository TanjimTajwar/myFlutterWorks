import 'package:flutter/material.dart';

class ZakahScreen extends StatefulWidget {
  const ZakahScreen({super.key});

  static const routeName = '/zakah';

  @override
  State<ZakahScreen> createState() => _ZakahScreenState();
}

class _ZakahScreenState extends State<ZakahScreen> {
  final TextEditingController _cashController = TextEditingController();
  final TextEditingController _goldController = TextEditingController();
  final TextEditingController _silverController = TextEditingController();
  final TextEditingController _investmentController = TextEditingController();
  final TextEditingController _debtController = TextEditingController();

  static const double _nisab = 87500;
  double _netAssets = 0;
  double _zakah = 0;
  bool _isEligible = false;

  @override
  void dispose() {
    _cashController.dispose();
    _goldController.dispose();
    _silverController.dispose();
    _investmentController.dispose();
    _debtController.dispose();
    super.dispose();
  }

  double _valueFrom(TextEditingController controller) {
    return double.tryParse(controller.text.trim()) ?? 0;
  }

  void _calculateZakah() {
    final cash = _valueFrom(_cashController);
    final gold = _valueFrom(_goldController);
    final silver = _valueFrom(_silverController);
    final investments = _valueFrom(_investmentController);
    final debts = _valueFrom(_debtController);

    final assets = cash + gold + silver + investments;
    final netAssets = assets - debts;
    final eligible = netAssets >= _nisab;
    final double zakahAmount = eligible ? netAssets * 0.025 : 0.0;

    setState(() {
      _netAssets = netAssets;
      _isEligible = eligible;
      _zakah = zakahAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Zakah Calculator'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A0F24),
              Color(0xFF1A1F3A),
              Color(0xFF2C2F6B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Enter yearly zakatable assets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              _MoneyField(
                controller: _cashController,
                hintText: 'Cash in hand/bank',
                icon: Icons.account_balance_wallet_outlined,
              ),
              _MoneyField(
                controller: _goldController,
                hintText: 'Gold value',
                icon: Icons.workspace_premium_outlined,
              ),
              _MoneyField(
                controller: _silverController,
                hintText: 'Silver value',
                icon: Icons.brightness_2_outlined,
              ),
              _MoneyField(
                controller: _investmentController,
                hintText: 'Business/Investments',
                icon: Icons.trending_up_outlined,
              ),
              _MoneyField(
                controller: _debtController,
                hintText: 'Short-term debts/liabilities',
                icon: Icons.money_off_csred_outlined,
              ),
              const SizedBox(height: 8),
              Text(
                'Nisab used: ৳${_nisab.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _calculateZakah,
                  icon: const Icon(Icons.calculate_outlined),
                  label: const Text('Calculate Zakah'),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Net Assets: ৳${_netAssets.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isEligible
                            ? 'Zakah Due (2.5%): ৳${_zakah.toStringAsFixed(2)}'
                            : 'Not eligible yet (below Nisab).',
                        style: TextStyle(
                          color: _isEligible
                              ? const Color(0xFF81C784)
                              : Colors.orangeAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoneyField extends StatelessWidget {
  const _MoneyField({
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

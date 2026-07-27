import 'package:flutter/material.dart';

void main() {
  runApp(const NeatGoApp());
}

class NeatGoApp extends StatelessWidget {
  const NeatGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NeatGo",
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"title": "Food", "icon": Icons.fastfood},
    {"title": "Grocery", "icon": Icons.shopping_basket},
    {"title": "Milk Subscription", "icon": Icons.local_drink},
    {"title": "Shopping", "icon": Icons.shopping_cart},
    {"title": "Pharmacy", "icon": Icons.local_hospital},
    {"title": "Electronics", "icon": Icons.devices},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NeatGo"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final title = categories[index]["title"];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (title == "Milk Subscription") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MilkSubscriptionScreen(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$title coming soon")),
                );
              }
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(categories[index]["icon"], size: 55, color: Colors.green),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MilkSubscriptionScreen extends StatefulWidget {
  const MilkSubscriptionScreen({super.key});

  @override
  State<MilkSubscriptionScreen> createState() => _MilkSubscriptionScreenState();
}

class _MilkSubscriptionScreenState extends State<MilkSubscriptionScreen> {
  final Set<String> subscribedProducts = {};
  String? selectedPlan;

  void _toggleSubscribe(String name) {
    setState(() {
      if (subscribedProducts.contains(name)) {
        subscribedProducts.remove(name);
      } else {
        subscribedProducts.add(name);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          subscribedProducts.contains(name)
              ? "Subscribed to $name"
              : "Removed $name from subscription",
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _selectPlan(String plan) {
    setState(() => selectedPlan = plan);
  }

  void _proceed() {
    if (subscribedProducts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select at least one product")),
      );
      return;
    }
    if (selectedPlan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a delivery plan")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Subscription Summary"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Plan: $selectedPlan"),
            const SizedBox(height: 8),
            const Text("Products:"),
            ...subscribedProducts.map((p) => Text("• $p")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Subscription confirmed!")),
              );
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  Widget product(String name, String price, IconData icon) {
    final isSubscribed = subscribedProducts.contains(name);
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(name),
        subtitle: Text(price),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSubscribed ? Colors.grey : null,
          ),
          onPressed: () => _toggleSubscribe(name),
          child: Text(isSubscribed ? "Subscribed" : "Subscribe"),
        ),
      ),
    );
  }

  Widget planCard(String title, String subtitle) {
    final isSelected = selectedPlan == title;
    return Card(
      color: isSelected ? Colors.green.shade50 : null

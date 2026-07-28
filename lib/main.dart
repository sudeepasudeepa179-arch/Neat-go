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
      home: const LoginScreen(),
    );
  }
}

// ---------------- PRODUCT DATA ----------------

class ProductData {
  static final Map<String, List<Map<String, dynamic>>> byCategory = {
    "Dairy & Milk": [
      {"name": "Cow Milk", "price": 55.0, "icon": Icons.local_drink, "unit": "1L"},
      {"name": "Buffalo Milk", "price": 70.0, "icon": Icons.local_drink, "unit": "1L"},
      {"name": "A2 Cow Milk", "price": 95.0, "icon": Icons.local_drink, "unit": "1L"},
      {"name": "Toned Milk", "price": 48.0, "icon": Icons.local_drink, "unit": "1L"},
      {"name": "Full Cream Milk", "price": 60.0, "icon": Icons.local_drink, "unit": "1L"},
      {"name": "Curd", "price": 40.0, "icon": Icons.egg, "unit": "500g"},
      {"name": "Paneer", "price": 90.0, "icon": Icons.restaurant, "unit": "200g"},
      {"name": "Butter", "price": 55.0, "icon": Icons.breakfast_dining, "unit": "100g"},
      {"name": "Cheese", "price": 120.0, "icon": Icons.lunch_dining, "unit": "200g"},
      {"name": "Ghee", "price": 650.0, "icon": Icons.local_fire_department, "unit": "500ml"},
    ],
    "Grocery": [
      {"name": "Basmati Rice", "price": 180.0, "icon": Icons.rice_bowl, "unit": "5kg"},
      {"name": "Toor Dal", "price": 140.0, "icon": Icons.grain, "unit": "1kg"},
      {"name": "Sunflower Oil", "price": 165.0, "icon": Icons.opacity, "unit": "1L"},
      {"name": "Wheat Atta", "price": 220.0, "icon": Icons.bakery_dining, "unit": "5kg"},
      {"name": "Sugar", "price": 48.0, "icon": Icons.icecream, "unit": "1kg"},
      {"name": "Tea Powder", "price": 95.0, "icon": Icons.emoji_food_beverage, "unit": "250g"},
      {"name": "Onions", "price": 35.0, "icon": Icons.eco, "unit": "1kg"},
      {"name": "Tomatoes", "price": 40.0, "icon": Icons.eco, "unit": "1kg"},
    ],
    "Fashion": [
      {"name": "Men's T-Shirt", "price": 399.0, "icon": Icons.checkroom, "unit": "1 pc"},
      {"name": "Women's Kurti", "price": 599.0, "icon": Icons.checkroom, "unit": "1 pc"},
      {"name": "Denim Jeans", "price": 899.0, "icon": Icons.checkroom, "unit": "1 pc"},
      {"name": "Sports Shoes", "price": 1299.0, "icon": Icons.hiking, "unit": "1 pair"},
      {"name": "Formal Shirt", "price": 699.0, "icon": Icons.checkroom, "unit": "1 pc"},
      {"name": "Sandals", "price": 449.0, "icon": Icons.hiking, "unit": "1 pair"},
    ],
    "Electronics": [
      {"name": "Wireless Earbuds", "price": 1499.0, "icon": Icons.headphones, "unit": "1 pc"},
      {"name": "Power Bank 10000mAh", "price": 999.0, "icon": Icons.battery_charging_full, "unit": "1 pc"},
      {"name": "USB Cable", "price": 149.0, "icon": Icons.cable, "unit": "1 pc"},
      {"name": "LED Bulb", "price": 99.0, "icon": Icons.lightbulb, "unit": "1 pc"},
      {"name": "Bluetooth Speaker", "price": 1799.0, "icon": Icons.speaker, "unit": "1 pc"},
      {"name": "Phone Charger", "price": 349.0, "icon": Icons.power, "unit": "1 pc"},
    ],
    "Pharmacy": [
      {"name": "Paracetamol Strip", "price": 25.0, "icon": Icons.medication, "unit": "10 tab"},
      {"name": "Hand Sanitizer", "price": 89.0, "icon": Icons.sanitizer, "unit": "200ml"},
      {"name": "Face Masks (Pack)", "price": 149.0, "icon": Icons.masks, "unit": "50 pcs"},
      {"name": "Vitamin C Tablets", "price": 199.0, "icon": Icons.medication_liquid, "unit": "30 tab"},
      {"name": "First Aid Kit", "price": 349.0, "icon": Icons.medical_services, "unit": "1 kit"},
      {"name": "Thermometer", "price": 249.0, "icon": Icons.thermostat, "unit": "1 pc"},
    ],
    "Food": [
      {"name": "Veg Biryani", "price": 180.0, "icon": Icons.rice_bowl, "unit": "1 plate"},
      {"name": "Paneer Butter Masala", "price": 220.0, "icon": Icons.dinner_dining, "unit": "1 bowl"},
      {"name": "Masala Dosa", "price": 90.0, "icon": Icons.breakfast_dining, "unit": "1 pc"},
      {"name": "Chicken Roll", "price": 150.0, "icon": Icons.fastfood, "unit": "1 pc"},
      {"name": "Cold Coffee", "price": 99.0, "icon": Icons.icecream, "unit": "1 glass"},
      {"name": "Veg Sandwich", "price": 79.0, "icon": Icons.lunch_dining, "unit": "1 pc"},
    ],
  };
}

// ---------------- LOGIN ----------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _login() {
    if (nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter name and phone number")),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => RootScreen(userName: nameController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.storefront, size: 80, color: Colors.green),
              const SizedBox(height: 10),
              const Text(
                "NeatGo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Groceries, food, fashion & more — delivered fast",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _login,
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- ROOT (BOTTOM NAV) ----------------

class RootScreen extends StatefulWidget {
  final String userName;
  const RootScreen({super.key, required this.userName});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> cart = [];
  final Set<String> wishlist = {};

  void addToCart(String name, double price, IconData icon) {
    final existing = cart.indexWhere((item) => item["name"] == name);
    setState(() {
      if (existing >= 0) {
        cart[existing]["qty"]++;
      } else {
        cart.add({"name": name, "price": price, "qty": 1, "icon": icon});
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$name added to cart"), duration: const Duration(seconds: 1)),
    );
  }

  void updateQty(String name, int delta) {
    setState(() {
      final index = cart.indexWhere((item) => item["name"] == name);
      if (index >= 0) {
        cart[index]["qty"] += delta;
        if (cart[index]["qty"] <= 0) cart.removeAt(index);
      }
    });
  }

  void toggleWishlist(String name) {
    setState(() {
      if (wishlist.contains(name)) {
        wishlist.remove(name);
      } else {
        wishlist.add(name);
      }
    });
  }

  double get cartTotal =>
      cart.fold(0, (sum, item) => sum + (item["price"] as double) * (item["qty"] as int));

  int get cartCount => cart.fold(0, (sum, item) => sum + (item["qty"] as int));

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeTab(
        userName: widget.userName,
        onAddToCart: addToCart,
        wishlist: wishlist,
        onToggleWishlist: toggleWishlist,
      ),
      WishlistTab(
        wishlist: wishlist,
        onToggleWishlist: toggleWishlist,
        onAddToCart: addToCart,
      ),
      CartTab(
        cart: cart,
        onUpdateQty: updateQty,
        total: cartTotal,
      ),
      ProfileTab(userName: widget.userName),
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) => setState(() => currentIndex = i),
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: "Home"),
          const NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: "Wishlist"),
          NavigationDestination(
            icon: Badge(
              label: Text("$cartCount"),
              isLabelVisible: cartCount > 0,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            selectedIcon: const Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          const NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ---------------- HOME ----------------

class HomeTab extends StatelessWidget {
  final String userName;
  final void Function(String, double, IconData) onAddToCart;
  final Set<String> wishlist;
  final void Function(String) onToggleWishlist;

  const HomeTab({
    super.key,
    required this.userName,
    required this.onAddToCart,
    required this.wishlist,
    required this.onToggleWishlist,
  });

  final List<Map<String, dynamic>> categories = const [
    {"title": "Dairy & Milk", "icon": Icons.local_drink, "color": Colors.green},
    {"title": "Grocery", "icon": Icons.shopping_basket, "color": Colors.orange},
    {"title": "Food", "icon": Icons.fastfood, "color": Colors.red},
    {"title": "Fashion", "icon": Icons.checkroom, "color": Colors.purple},
    {"title": "Electronics", "icon": Icons.devices, "color": Colors.blue},
    {"title": "Pharmacy", "icon": Icons.local_hospital, "color": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, $userName 👋"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search for milk, groceries, food...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Everything delivered in minutes",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text("Milk, groceries, food, fashion & more",
                          style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Icon(Icons.two_wheeler, size: 50, color: Colors.green),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("Shop by category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryScreen(
                        categoryTitle: cat["title"],
                        onAddToCart: onAddToCart,
                        wishlist: wishlist,
                        onToggleWishlist: onToggleWishlist,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(cat["icon"], size: 32, color: cat["color"]),
                      const SizedBox(height: 6),
                      Text(
                        cat["title"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ---------------- CATEGORY / PRODUCT LIST (shared by all categories) ----------------

class CategoryScreen extends StatefulWidget {
  final String categoryTitle;
  final void Function(String, double, IconData) onAddToCart;
  final Set<String> wishlist;
  final void Function(String) onToggleWishlist;

  const CategoryScreen({
    super.key,
    required this.categoryTitle,
    required this.onAddToCart,
    required this.wishlist,
    required this.onToggleWishlist,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final products = ProductData.byCategory[widget.categoryTitle] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle)),
      body: products.isEmpty
          ? const Center(child: Text("No products yet in this category"))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                final name = p["name"] as String;
                final price = p["price"] as double;
                final icon = p["icon"] as IconData;
                final unit = p["unit"] as String;
                final inWishlist = widget.wishlist.contains(name);

                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            name: name,
                            price: price,
                            icon: icon,
                            unit: unit,
                            category: widget.categoryTitle,
                            onAddToCart: widget.onAddToCart,
                            inWishlist: inWishlist,
                            onToggleWishlist: widget.onToggleWishlist,
                          ),
                        ),
                      );
                    },
                    leading: Icon(icon, color: Colors.green, size: 30),
                    title: Text(name),
                    subtitle: Text("₹${price.toStringAsFixed(0)} · $unit"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(inWishlist ? Icons.favorite : Icons.favorite_border,
                              color: inWishlist ? Colors.red : null),
                          onPressed: () => setState(() => widget.onToggleWishlist(name)),
                        ),
                        ElevatedButton(
                          onPressed: () => widget.onAddToCart(name, price, icon),
                          child: const Text("Add"),
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

// ---------------- PRODUCT DETAIL ----------------

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final double price;
  final IconData icon;
  final String unit;
  final String category;
  final void Function(String, double, IconData) onAddToCart;
  final bool inWishlist;
  final void Function(String) onToggleWishlist;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.unit,
    required this.category,
    required this.onAddToCart,
    required this.inWishlist,
    required this.onToggleWishlist,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  late bool wished;

  @override
  void initState() {
    super.initState();
    wished = widget.inWishlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: Icon(wished ? Icons.favorite : Icons.favorite_border,
                color: wished ? Colors.red : null),
            onPressed: () {
              widget.onToggleWishlist(widget.name);
              setState(() => wished = !wished);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, size: 70, color: Colors.green),
              ),
            ),
            const SizedBox(height: 24),
            Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(widget.category, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("₹${widget.price.toStringAsFixed(0)} · ${widget.unit}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Quantity", style: TextStyle(fontSize: 16)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                ),
                Text("$quantity", style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                onPressed: () {
                  for (int i = 0; i < quantity; i++) {
                    widget.onAddToCart(widget.name, widget.price, widget.icon);
                  }
                  Navigator.pop(context);
                },
                child: Text("Add $quantity to Cart · ₹${(widget.price * quantity).toStringAsFixed(0)}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- WISHLIST ----------------

class WishlistTab extends StatelessWidget {
  final Set<String> wishlist;
  final void Function(String) onToggleWishlist;
  final void Function(String, double, IconData) onAddToCart;

  const WishlistTab({
    super.key,
    required this.wishlist,
    required this.onToggleWishlist,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: wishlist.isEmpty
          ? const Center(child: Text("Your wishlist is empty"))
          : ListView(
              padding: const EdgeInsets.all(15),
              children: wishlist.map((name) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    title: Text(name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => onToggleWishlist(name),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}

// ---------------- CART ----------------

class CartTab extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final void Function(String, int) onUpdateQty;
  final double total;

  const CartTab({
    super.key,
    required this.cart,
    required this.onUpdateQty,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: cart.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(item["icon"], color: Colors.green),
                          title: Text(item["name"]),
                          subtitle: Text("₹${item["price"]} x ${item["qty"]}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => onUpdateQty(item["name"], -1),
                              ),
                              Text("${item["qty"]}"),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => onUpdateQty(item["name"], 1),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("₹${total.toStringAsFixed(0)}",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CheckoutScreen(total: total)),
                          );
                        },
                        child: const Text("Proceed to Checkout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

// ---------------- CHECKOUT ----------------

class CheckoutScreen extends StatelessWidget {
  final double total;
  const CheckoutScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text("Deliver to"),
              subtitle: Text("Hanchina Siddapura, Bhadravathi Taluk, Shivamogga"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text("Payment method"),
              subtitle: Text("Cash on Delivery"),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("Order total"),
              subtitle: Text("₹${total.toStringAsFixed(0)}"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Order Placed 🎉"),
                    content: Text("Your order of ₹${total.toStringAsFixed(0)} has been placed successfully."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text("Back to Home"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- PROFILE ----------------

class ProfileTab extends StatelessWidget {
  final String userName;
  const ProfileTab({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.green.shade100,
            child: const Icon(Icons.person, size: 40, color: Colors.green),
          ),
          const SizedBox(height: 12),
          Text(userName, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Divider(),
          const ListTile(leading: Icon(Icons.receipt_long), title: Text("Order History")),
          const ListTile(leading: Icon(Icons.location_on_outlined), title: Text("Saved Addresses")),
          const ListTile(leading: Icon(Icons.help_outline), title: Text("Help & Support")),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

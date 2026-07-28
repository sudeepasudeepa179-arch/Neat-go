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

// ---------------- SHARED IMAGE WIDGET ----------------

class ProductImage extends StatelessWidget {
  final String url;
  final IconData fallbackIcon;
  final double size;
  final double radius;

  const ProductImage({
    super.key,
    required this.url,
    required this.fallbackIcon,
    this.size = 64,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: size,
            height: size,
            color: Colors.green.shade50,
            child: const Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            color: Colors.green.shade50,
            child: Icon(fallbackIcon, color: Colors.green, size: size * 0.5),
          );
        },
      ),
    );
  }
}

// ---------------- PRODUCT DATA ----------------

class ProductData {
  // Picsum is a stable, reliable free photo service - each seed always
  // returns the same real photograph, so images load consistently.
  static String _img(String seed) =>
      "https://picsum.photos/seed/${Uri.encodeComponent(seed)}/500/500";

  static final Map<String, List<Map<String, dynamic>>> byCategory = {
    "Dairy & Milk": [
      {"name": "Cow Milk", "price": 55.0, "icon": Icons.local_drink, "unit": "1L", "image": _img("neatgo-cow-milk")},
      {"name": "Buffalo Milk", "price": 70.0, "icon": Icons.local_drink, "unit": "1L", "image": _img("neatgo-buffalo-milk")},
      {"name": "A2 Cow Milk", "price": 95.0, "icon": Icons.local_drink, "unit": "1L", "image": _img("neatgo-a2-milk")},
      {"name": "Toned Milk", "price": 48.0, "icon": Icons.local_drink, "unit": "1L", "image": _img("neatgo-toned-milk")},
      {"name": "Full Cream Milk", "price": 60.0, "icon": Icons.local_drink, "unit": "1L", "image": _img("neatgo-cream-milk")},
      {"name": "Curd", "price": 40.0, "icon": Icons.egg, "unit": "500g", "image": _img("neatgo-curd")},
      {"name": "Paneer", "price": 90.0, "icon": Icons.restaurant, "unit": "200g", "image": _img("neatgo-paneer")},
      {"name": "Butter", "price": 55.0, "icon": Icons.breakfast_dining, "unit": "100g", "image": _img("neatgo-butter")},
      {"name": "Cheese", "price": 120.0, "icon": Icons.lunch_dining, "unit": "200g", "image": _img("neatgo-cheese")},
      {"name": "Ghee", "price": 650.0, "icon": Icons.local_fire_department, "unit": "500ml", "image": _img("neatgo-ghee")},
    ],
    "Grocery": [
      {"name": "Basmati Rice", "price": 180.0, "icon": Icons.rice_bowl, "unit": "5kg", "image": _img("neatgo-basmati-rice")},
      {"name": "Toor Dal", "price": 140.0, "icon": Icons.grain, "unit": "1kg", "image": _img("neatgo-toor-dal")},
      {"name": "Sunflower Oil", "price": 165.0, "icon": Icons.opacity, "unit": "1L", "image": _img("neatgo-sunflower-oil")},
      {"name": "Wheat Atta", "price": 220.0, "icon": Icons.bakery_dining, "unit": "5kg", "image": _img("neatgo-wheat-atta")},
      {"name": "Sugar", "price": 48.0, "icon": Icons.icecream, "unit": "1kg", "image": _img("neatgo-sugar")},
      {"name": "Tea Powder", "price": 95.0, "icon": Icons.emoji_food_beverage, "unit": "250g", "image": _img("neatgo-tea-powder")},
      {"name": "Onions", "price": 35.0, "icon": Icons.eco, "unit": "1kg", "image": _img("neatgo-onions")},
      {"name": "Tomatoes", "price": 40.0, "icon": Icons.eco, "unit": "1kg", "image": _img("neatgo-tomatoes")},
      {"name": "Potatoes", "price": 30.0, "icon": Icons.eco, "unit": "1kg", "image": _img("neatgo-potatoes")},
      {"name": "Green Chillies", "price": 20.0, "icon": Icons.eco, "unit": "250g", "image": _img("neatgo-chillies")},
      {"name": "Carrots", "price": 45.0, "icon": Icons.eco, "unit": "1kg", "image": _img("neatgo-carrots")},
      {"name": "Spinach", "price": 25.0, "icon": Icons.eco, "unit": "1 bunch", "image": _img("neatgo-spinach")},
    ],
    "Fashion": [
      {"name": "Men's T-Shirt", "price": 399.0, "icon": Icons.checkroom, "unit": "1 pc", "image": _img("neatgo-mens-tshirt")},
      {"name": "Women's Kurti", "price": 599.0, "icon": Icons.checkroom, "unit": "1 pc", "image": _img("neatgo-womens-kurti")},
      {"name": "Denim Jeans", "price": 899.0, "icon": Icons.checkroom, "unit": "1 pc", "image": _img("neatgo-denim-jeans")},
      {"name": "Sports Shoes", "price": 1299.0, "icon": Icons.hiking, "unit": "1 pair", "image": _img("neatgo-sports-shoes")},
      {"name": "Formal Shirt", "price": 699.0, "icon": Icons.checkroom, "unit": "1 pc", "image": _img("neatgo-formal-shirt")},
      {"name": "Sandals", "price": 449.0, "icon": Icons.hiking, "unit": "1 pair", "image": _img("neatgo-sandals")},
    ],
    "Electronics": [
      {"name": "Wireless Earbuds", "price": 1499.0, "icon": Icons.headphones, "unit": "1 pc", "image": _img("neatgo-earbuds")},
      {"name": "Power Bank 10000mAh", "price": 999.0, "icon": Icons.battery_charging_full, "unit": "1 pc", "image": _img("neatgo-powerbank")},
      {"name": "USB Cable", "price": 149.0, "icon": Icons.cable, "unit": "1 pc", "image": _img("neatgo-usbcable")},
      {"name": "LED Bulb", "price": 99.0, "icon": Icons.lightbulb, "unit": "1 pc", "image": _img("neatgo-ledbulb")},
      {"name": "Bluetooth Speaker", "price": 1799.0, "icon": Icons.speaker, "unit": "1 pc", "image": _img("neatgo-speaker")},
      {"name": "Phone Charger", "price": 349.0, "icon": Icons.power, "unit": "1 pc", "image": _img("neatgo-charger")},
    ],
    "Pharmacy": [
      {"name": "Paracetamol Strip", "price": 25.0, "icon": Icons.medication, "unit": "10 tab", "image": _img("neatgo-paracetamol")},
      {"name": "Hand Sanitizer", "price": 89.0, "icon": Icons.sanitizer, "unit": "200ml", "image": _img("neatgo-sanitizer")},
      {"name": "Face Masks (Pack)", "price": 149.0, "icon": Icons.masks, "unit": "50 pcs", "image": _img("neatgo-facemasks")},
      {"name": "Vitamin C Tablets", "price": 199.0, "icon": Icons.medication_liquid, "unit": "30 tab", "image": _img("neatgo-vitaminc")},
      {"name": "First Aid Kit", "price": 349.0, "icon": Icons.medical_services, "unit": "1 kit", "image": _img("neatgo-firstaid")},
      {"name": "Thermometer", "price": 249.0, "icon": Icons.thermostat, "unit": "1 pc", "image": _img("neatgo-thermometer")},
      {"name": "Cough Syrup", "price": 110.0, "icon": Icons.medication, "unit": "100ml", "image": _img("neatgo-coughsyrup")},
      {"name": "Band-Aid Pack", "price": 45.0, "icon": Icons.healing, "unit": "20 pcs", "image": _img("neatgo-bandaid")},
    ],
    "Food": [
      {"name": "Veg Biryani", "price": 180.0, "icon": Icons.rice_bowl, "unit": "1 plate", "image": _img("neatgo-biryani")},
      {"name": "Paneer Butter Masala", "price": 220.0, "icon": Icons.dinner_dining, "unit": "1 bowl", "image": _img("neatgo-panner-masala")},
      {"name": "Masala Dosa", "price": 90.0, "icon": Icons.breakfast_dining, "unit": "1 pc", "image": _img("neatgo-dosa")},
      {"name": "Chicken Roll", "price": 150.0, "icon": Icons.fastfood, "unit": "1 pc", "image": _img("neatgo-chickenroll")},
      {"name": "Cold Coffee", "price": 99.0, "icon": Icons.icecream, "unit": "1 glass", "image": _img("neatgo-coldcoffee")},
      {"name": "Veg Sandwich", "price": 79.0, "icon": Icons.lunch_dining, "unit": "1 pc", "image": _img("neatgo-sandwich")},
      {"name": "Idli Sambar", "price": 70.0, "icon": Icons.breakfast_dining, "unit": "1 plate", "image": _img("neatgo-idli")},
      {"name": "Butter Naan", "price": 45.0, "icon": Icons.bakery_dining, "unit": "1 pc", "image": _img("neatgo-naan")},
    ],
  };

  static Map<String, dynamic>? findByName(String name) {
    for (final list in byCategory.values) {
      for (final p in list) {
        if (p["name"] == name) return p;
      }
    }
    return null;
  }
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
        builder: (_) => RootScreen(
          userName: nameController.text.trim(),
          userPhone: phoneController.text.trim(),
        ),
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
                "Groceries, food, fashion & more â€” delivered fast",
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
  final String userPhone;
  const RootScreen({super.key, required this.userName, required this.userPhone});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> cart = [];
  final Set<String> wishlist = {};

  void addToCart(String name, double price, IconData icon, String image) {
    final existing = cart.indexWhere((item) => item["name"] == name);
    setState(() {
      if (existing >= 0) {
        cart[existing]["qty"]++;
      } else {
        cart.add({"name": name, "price": price, "qty": 1, "icon": icon, "image": image});
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
      ProfileTab(userName: widget.userName, userPhone: widget.userPhone),
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
  final void Function(String, double, IconData, String) onAddToCart;
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
        title: Text("Hi, $userName ðŸ‘‹"),
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
              gradient: LinearGradient(
                colors: [Colors.green.shade100, Colors.green.shade50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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

// ---------------- CATEGORY / PRODUCT LIST ----------------

class CategoryScreen extends StatefulWidget {
  final String categoryTitle;
  final void Function(String, double, IconData, String) onAddToCart;
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
                final image = p["image"] as String;
                final inWishlist = widget.wishlist.contains(name);

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              name: name,
                              price: price,
                              icon: icon,
                              unit: unit,
                              image: image,
                              category: widget.categoryTitle,
                              onAddToCart: widget.onAddToCart,
                              inWishlist: inWishlist,
                              onToggleWishlist: widget.onToggleWishlist,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          ProductImage(url: image, fallbackIcon: icon, size: 64),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                const SizedBox(height: 4),
                                Text("â‚¹${price.toStringAsFixed(0)} Â· $unit",
                                    style: TextStyle(color: Colors.grey.shade700)),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(inWishlist ? Icons.favorite : Icons.favorite_border,
                                color: inWishlist ? Colors.red : null),
                            onPressed: () => setState(() => widget.onToggleWishlist(name)),
                          ),
                          ElevatedButton(
                            onPressed: () => widget.onAddToCart(name, price, icon, image),
                            child: const Text("Add"),
                          ),
                        ],
                      ),
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
  final String image;
  final String category;
  final void Function(String, double, IconData, String) onAddToCart;
  final bool inWishlist;
  final void Function(String) onToggleWishlist;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.unit,
    required this.image,
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
              child: ProductImage(
                url: widget.image,
                fallbackIcon: widget.icon,
                size: 220,
                radius: 20,
              ),
            ),
            const SizedBox(height: 24),
            Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(widget.category, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("â‚¹${widget.price.toStringAsFixed(0)} Â· ${widget.unit}",
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
                    widget.onAddToCart(widget.name, widget.price, widget.icon, widget.image);
                  }
                  Navigator.pop(context);
                },
                child: Text("Add $quantity to Cart Â· â‚¹${(widget.price * quantity).toStringAsFixed(0)}"),
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
  final void Function(String, double, IconData, String) onAddToCart;

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
                final p = ProductData.findByName(name);
                final price = (p?["price"] as double?) ?? 0.0;
                final icon = (p?["icon"] as IconData?) ?? Icons.shopping_bag;
                final image = (p?["image"] as String?) ?? "";

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ProductImage(url: image, fallbackIcon: icon, size: 60),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              const SizedBox(height: 4),
                              Text("â‚¹${price.toStringAsFixed(0)}", style: TextStyle(color: Colors.grey.shade700)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
                          onPressed: () => onAddToCart(name, price, icon, image),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => onToggleWishlist(name),
                        ),
                      ],
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
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              ProductImage(
                                url: item["image"] as String? ?? "",
                                fallbackIcon: item["icon"] as IconData,
                                size: 60,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item["name"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                    const SizedBox(height: 4),
                                    Text("â‚¹${item["price"]} x ${item["qty"]}",
                                        style: TextStyle(color: Colors.grey.shade700)),
                                  ],
                                ),
                              ),
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
                          Text("â‚¹${total.toStringAsFixed(0)}",
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
              subtitle: Text("â‚¹${total.toStringAsFixed(0)}"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Order Placed ðŸŽ‰"),
                    content: Text("Your order of â‚¹${total.toStringAsFixed(0)} has been placed successfully."),
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
  final String userPhone;
  const ProfileTab({super.key, required this.userName, required this.userPhone});

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
          const SizedBox(height: 4),
          Text(userPhone, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          const Divider(),
          const ListTile(leading: Icon(Icons.receipt_long), title: Text("Order History")),
          const ListTile(leading: Icon(Icons.location_on_outlined), title: Text("Saved Addresses")),
          const ListTile(leading: Icon(Icons.payment), title: Text("Payment Methods")),
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

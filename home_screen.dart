import 'package:flutter/material.dart';
import '../cart_model.dart';
import '../data.dart';
import '../models.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _category = 'All';
  String _query = '';

  List<Product> get _filtered => products.where((p) {
        final matchCat = _category == 'All' || p.category == _category;
        final matchQuery =
            p.name.toLowerCase().contains(_query.trim().toLowerCase());
        return matchCat && matchQuery;
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FreshCart 🛒'),
        actions: [
          ListenableBuilder(
            listenable: cart,
            builder: (context, _) => IconButton(
              tooltip: 'Cart',
              icon: Badge(
                label: Text('${cart.count}'),
                isLabelVisible: cart.count > 0,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search groceries',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28)),
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          SizedBox(
            height: 52,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) => ChoiceChip(
                label: Text(categories[i]),
                selected: _category == categories[i],
                onSelected: (_) => setState(() => _category = categories[i]),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('No products found'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => ProductCard(product: _filtered[i]),
                  ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(product.emoji, style: const TextStyle(fontSize: 56)),
              ),
            ),
            Text(product.name,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(product.unit,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                ListenableBuilder(
                  listenable: cart,
                  builder: (context, _) {
                    final qty = cart.qtyOf(product.id);
                    if (qty == 0) {
                      return FilledButton.tonal(
                        onPressed: () => cart.add(product),
                        child: const Text('Add'),
                      );
                    }
                    return Row(
                      children: [
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => cart.remove(product),
                        ),
                        Text('$qty'),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () => cart.add(product),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

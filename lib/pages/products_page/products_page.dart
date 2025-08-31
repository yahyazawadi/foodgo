import 'package:dofood/pages/products_page/product_details.dart';
import 'package:dofood/pages/products_page/widgets/bottom_bar.dart';
import 'package:dofood/pages/products_page/widgets/header.dart';
import 'package:dofood/pages/products_page/widgets/search_row.dart';
import 'package:dofood/pages/products_page/widgets/category_chips.dart';
import 'package:dofood/pages/products_page/widgets/product_grid.dart';
import 'package:dofood/pages/products_page/widgets/empty_state.dart';
import 'package:dofood/pages/products_page/widgets/add_product_fab.dart';
import 'package:dofood/pages/products_page/filters/product_filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dofood/models/product_model.dart';
import 'package:dofood/providers/product_provider.dart';
import 'package:dofood/pages/products_page/filters/debouncer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 180);

  String _selectedCategory = 'All';
  final Set<int> _favourites = {};
  List<Product> _filtered = [];
  late ProductProvider _provider;

  List<String> _categories = const ['All'];

  @override
  void initState() {
    super.initState();

    _provider = Provider.of<ProductProvider>(context, listen: false);

    _searchController.addListener(() {
      _debouncer.run(_applyFilters);
    });

    _loadProducts();
    _provider.addListener(_onProviderChanged);
  }

  Future<void> _loadProducts() async {
    try {
      await _provider.fetchProducts();
      _rebuildCategories();
      _applyFilters();
    } catch (_) {
      // Even if fetch failed, try to reflect whatever data is currently there.
      _rebuildCategories();
      _applyFilters();
    }
  }

  void _rebuildCategories() {
    final built = buildCategories(_provider.products);
    setState(() => _categories = built);
  }

  void _onProviderChanged() {
    if (!mounted) return;
    _rebuildCategories();
    _applyFilters();
  }

  void _applyFilters() {
    final query = _searchController.text;
    final filtered = filterProducts(
      _provider.products,
      query,
      _selectedCategory,
    );
    if (!mounted) return;
    setState(() {
      _filtered = filtered;
    });
  }

  void _toggleFavorite(int id) {
    setState(() {
      if (_favourites.contains(id)) {
        _favourites.remove(id);
      } else {
        _favourites.add(id);
      }
    });
  }

  void _onTapProduct(Product p) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ProductDetails(productId: p.id)));
  }

  @override
  void dispose() {
    _searchController.removeListener(_applyFilters);
    _searchController.dispose();
    try {
      _provider.removeListener(_onProviderChanged);
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            buildSearchRow(_searchController, context),
            const SizedBox(height: 6),
            CategoryChips(
              categories: _categories,
              selectedCategory: _selectedCategory,
              onChanged: (value) {
                setState(() => _selectedCategory = value);
                _applyFilters();
              },
            ),
            if (_filtered.isEmpty)
              const Expanded(
                child: Center(
                  child: EmptyState(
                    message: 'No items match your search / filter.',
                  ),
                ),
              )
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: ProductGrid(
                    products: _filtered,
                    isFavorite: (id) => _favourites.contains(id),
                    onTap: _onTapProduct,
                    onToggleFavorite: (id) => _toggleFavorite(id),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddProductFAB(onPressed: () {}),
      bottomNavigationBar: buildBottomBar(),
    );
  }
}

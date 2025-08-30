import 'package:dofood/pages/products_page/product_details.dart';
import 'package:dofood/pages/products_page/widgets/bottom_bar.dart';
import 'package:dofood/pages/products_page/widgets/header.dart';
import 'package:dofood/pages/products_page/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dofood/models/product_model.dart';
import 'package:dofood/providers/product_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  final Set<int> _favourites = {};
  List<Product> _filtered = [];
  late ProductProvider _provider;

  List<String> _categories = ['All']; // dynamically built later

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    // fetch products after first frame so Provider.of works

    _provider = Provider.of<ProductProvider>(context, listen: false);
    _loadProducts();
    // listen for changes from provider (so UI updates when provider finishes)
    _provider.addListener(_onProviderChanged);
  }

  Future<void> _loadProducts() async {
    try {
      await Provider.of<ProductProvider>(
        context,
        listen: false,
      ).fetchProducts();
      _buildCategories();
      _applyFilters();
    } catch (_) {
      _applyFilters();
    }
  }

  void _buildCategories() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final cats = provider.products.map((p) => p.category).toSet().toList();
    cats.sort();
    setState(() {
      _categories = ['All', ...cats];
    });
  }

  void _onProviderChanged() {
    // when provider updates, re-apply filters
    if (mounted) _applyFilters();
  }

  void _onSearchChanged() => _applyFilters();

  void _applyFilters() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final query = _searchController.text.trim().toLowerCase();

    final products = provider.products.where((p) {
      final matchesQuery =
          query.isEmpty ||
          p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
      final matchesCategory =
          _selectedCategory == 'All' ||
          p.category.toLowerCase() == _selectedCategory.toLowerCase();
      return matchesQuery && matchesCategory;
    }).toList();

    setState(() {
      _filtered = products;
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
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    try {
      _provider.removeListener(_onProviderChanged);
    } catch (_) {}
    super.dispose();
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final label = _categories[i];
          final selected = label == _selectedCategory;
          return ChoiceChip(
            label: Text(label),
            selected: selected,
            onSelected: (val) {
              setState(() => _selectedCategory = val ? label : 'All');
              _applyFilters();
            },
            selectedColor: Colors.red.shade400,
            backgroundColor: Colors.grey.shade200,
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black87,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          );
        },
      ),
    );
  }

  Widget _buildGrid() {
    if (_filtered.isEmpty) {
      return const Expanded(
        child: Center(child: Text('No items match your search / filter.')),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: GridView.builder(
          itemCount: _filtered.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final item = _filtered[index];
            return GestureDetector(
              onTap: () => _onTapProduct(item),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1.6,
                            child: CachedNetworkImage(
                              imageUrl: item.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(
                            item.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 6),
                              Text(item.rating.toStringAsFixed(1)),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: GestureDetector(
                        onTap: () => _toggleFavorite(item.id),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            _favourites.contains(item.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _favourites.contains(item.id)
                                ? Colors.red
                                : Colors.grey[600],
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The provider changes are handled via listener set in initState.
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            buildSearchRow(_searchController, context),
            const SizedBox(height: 6),
            _buildCategoryChips(),
            _buildGrid(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red.shade400,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:dofood/models/product_model.dart';
import 'package:dofood/providers/product_provider.dart';

import 'widgets/detail_header_image.dart';
import 'widgets/detail_meta_section.dart';
import 'widgets/detail_description.dart';
import 'widgets/detail_quick_facts.dart';
import 'widgets/detail_spicy_slider.dart';
import 'widgets/detail_portion_selector.dart';
import 'widgets/detail_price_action.dart';

class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _portion = 2;
  double _spicy = 20;

  Product? product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final prov = Provider.of<ProductProvider>(context, listen: false);
    try {
      product = prov.products.firstWhere((p) => p.id == widget.productId);
    } catch (_) {
      product = null;
    }

    if (product != null) {
      final s = product!.spicyLevel;
      _spicy = (s <= 5) ? (s * 20).toDouble() : s.toDouble().clamp(0, 100);
      _portion = 2;
    }
  }

  void _incPortion() => setState(() => _portion++);
  void _decPortion() =>
      setState(() => _portion = (_portion > 1 ? _portion - 1 : 1));

  @override
  Widget build(BuildContext context) {
    final bg = const Color(0xFFF7F7FA);
    final accentRed = Colors.red.shade400;
    final darkBrown = const Color(0xFF3B2F2F);

    final p =
        product ??
        Product(
          id: 0,
          name: "error",
          description: "error",
          image: '',
          rating: 0,
          price: 0,
          category: 'error',
          reviews: 0,
          ingredients: [],
          calories: 0,
          preparationTime: 'error',
          spicyLevel: 0,
          vegetarian: false,
          available: false,
        );

    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: DetailHeaderImage(image: p.image),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailMetaSection(p: p),
                  const SizedBox(height: 12),
                  DetailDescription(description: p.description),
                  const SizedBox(height: 12),
                  DetailQuickFacts(p: p),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: DetailSpicySlider(
                          spicy: _spicy,
                          onChanged: (v) => setState(() => _spicy = v),
                        ),
                      ),
                      const SizedBox(width: 12),
                      DetailPortionSelector(
                        portion: _portion,
                        onDec: _decPortion,
                        onInc: _incPortion,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  DetailPriceAction(
                    price: p.price,
                    isAvailable: p.available,
                    accentRed: accentRed,
                    darkBrown: darkBrown,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

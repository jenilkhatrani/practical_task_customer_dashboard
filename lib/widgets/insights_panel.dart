import 'package:flutter/material.dart';

class InsightsPanel extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const InsightsPanel({super.key, required this.orders});

  Map<String, int> getTotalPerCustomer() {
    Map<String, int> totals = {};

    for (var order in orders) {
      String customer = order['customer'];
      int total = 0;

      for (var item in order['items']) {
        total += int.parse((item['price']).toString());
      }
      totals.containsKey(customer)
          ? totals[customer] = totals[customer] ?? 0 + total
          : totals[customer] = total;
    }
    return totals;
  }

  String getTopProduct() {
    Map<String, int> count = {};

    for (var order in orders) {
      for (var item in order['items']) {
        String product = item['product'];
        count[product] = (count[product] ?? 0) + 1;
      }
    }
    String topProduct = '';
    int maxCount = 0;
    count.forEach((key, value) {
      if (value > maxCount) {
        maxCount = value;
        topProduct = key;
      }
    });
    return topProduct;
  }

  List<String> getUniqueProducts() {
    Set<String> products = {};
    for (var order in orders) {
      for (var item in order['items']) {
        products.add(item['product']);
      }
    }
    return products.toList();
  }

  int getHighValueOrders() {
    int count = 0;
    for (var order in orders) {
      int total = 0;
      for (var item in order['items']) {
        total += int.parse((item['price']).toString());
      }
      if (total > 2000) {
        count++;
      }
    }
    return count;
  }
//price above 2000

  // int getHighValueOrders() {
  //   int count = 0;
  //   for (var order in orders) {
  //     for (var item in order['items']) {
  //       int price = int.parse((item['price']).toString());
  //       if (price >= 2000) {
  //         count++;
  //       }
  //     }
  //   }
  //   return count;
  // }

  Widget simpleCard(
      String title, String value, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        width: 150,
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal.shade100),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.teal),
            const SizedBox(height: 8),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(value, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  void showPerCustomerTotalSheet(BuildContext context) {
    final totals = getTotalPerCustomer();

    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ListView.builder(
            itemCount: totals.length,
            itemBuilder: (context, index) {
              final entry = totals.entries.elementAt(index);
              return ListTile(
                title: Text(entry.key),
                trailing: Text("₹${entry.value}"),
              );
            },
          );
        });
  }

  void showUniqueProductsSheet(BuildContext context) {
    final products = getUniqueProducts();

    showModalBottomSheet(
      context: context,
      builder: (_) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPerCustomer = getTotalPerCustomer();
    final topProduct = getTopProduct();
    final uniqueProducts = getUniqueProducts();
    final highValueOrders = getHighValueOrders();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          simpleCard("Total Customers", totalPerCustomer.length.toString(),
              Icons.people, () => showPerCustomerTotalSheet(context)),
          simpleCard("Unique Products", uniqueProducts.length.toString(),
              Icons.category, () => showUniqueProductsSheet(context)),
          simpleCard("Top Product", topProduct, Icons.trending_up, () {}),
          simpleCard("High Value Orders", highValueOrders.toString(),
              Icons.star, () {}),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practical_taskl_customer_order/data/orders_sample.dart';
import '../widgets/order_card.dart';
import '../widgets/insights_panel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          InsightsPanel(orders: orders),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(order: orders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

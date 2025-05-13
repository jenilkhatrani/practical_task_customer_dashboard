import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final Map<String, dynamic> order;

  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  int getTotalValue() {
    int total = 0;
    for (var item in widget.order["items"]) {
      total += int.parse((item["price"]).toString());
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.teal.shade100,
                    child: const Icon(Icons.receipt_long, color: Colors.teal),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID: ${widget.order["orderId"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text("Customer: ${widget.order["customer"]}"),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "₹${getTotalValue()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.teal,
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (isExpanded) const Divider(height: 20),
            if (isExpanded)
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.order["items"].length,
                  itemBuilder: (context, index) {
                    var item = widget.order["items"][index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item["product"]),
                          Text(
                            "₹${item["price"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

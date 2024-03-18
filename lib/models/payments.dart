import 'package:flutter/material.dart';

class Payment {
  final IconData icon;
  final String title;
  final Color color;

  Payment({required this.icon, required this.title, required this.color});
  static List<Payment> paymentList = [
    Payment(
        icon: Icons.verified, title: "Payment received", color: Colors.green),
    Payment(icon: Icons.refresh, title: "Processing", color: Colors.yellow),
    Payment(icon: Icons.cancel, title: "Payment Cancelled", color: Colors.red),
    Payment(
        icon: Icons.verified, title: "Payment received", color: Colors.green),
    Payment(icon: Icons.refresh, title: "Processing", color: Colors.yellow),
    Payment(icon: Icons.cancel, title: "Payment Cancelled", color: Colors.red),
    Payment(
        icon: Icons.verified, title: "Payment received", color: Colors.green),
    Payment(icon: Icons.refresh, title: "Processing", color: Colors.yellow),
    Payment(icon: Icons.cancel, title: "Payment Cancelled", color: Colors.red),
  ];
}

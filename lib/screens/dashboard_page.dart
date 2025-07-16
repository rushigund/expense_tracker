import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isOnline = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Define custom colors
    const maroon = Color(0xFF4B0C0C);
    const green = Color(0xFF2ECC40);
    const lightGrey = Color(0xFFF5F5F5);
    const greyText = Color(0xFF888888);
    const darkText = Color(0xFF222222);
    const white = Colors.white;

    return Scaffold(
      backgroundColor: maroon,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // ------------------ Top Section ------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status bar mock
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '9:41',
                        style: TextStyle(
                          color: white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_alt, color: white, size: 18),
                          SizedBox(width: 4),
                          Icon(Icons.wifi, color: white, size: 18),
                          SizedBox(width: 4),
                          Icon(Icons.battery_full, color: white, size: 18),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hamburger menu
                      Container(
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.menu, color: white, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pill-shaped greeting
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Good Afternoon',
                                style: TextStyle(
                                  color: maroon,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Large name
                            const Text(
                              'Jone Doe',
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Subtext: Amount and Orders
                            Row(
                              children: [
                                Icon(Icons.account_balance_wallet, color: white, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  'Today Amount Collected ',
                                  style: TextStyle(color: white, fontSize: 14),
                                ),
                                Text(
                                  '₹599.50',
                                  style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.local_shipping, color: white, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  'Order Delivered Today ',
                                  style: TextStyle(color: white, fontSize: 14),
                                ),
                                Text(
                                  '14',
                                  style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Shopping cart graphic (dummy)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Icon(Icons.shopping_cart, color: white, size: 48),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ------------------ Status Section ------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: maroon.withOpacity(0.08),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, color: green, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Status: ',
                          style: TextStyle(
                            color: darkText,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            color: green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: isOnline,
                      activeColor: green,
                      onChanged: (val) {
                        setState(() => isOnline = val);
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ------------------ Order Section ------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  children: [
                    // 3D hand with parcel (dummy icon)
                    CircleAvatar(
                      backgroundColor: maroon.withOpacity(0.1),
                      radius: 26,
                      child: Icon(Icons.handshake, color: maroon, size: 32),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4 Delivery Orders Found!',
                            style: TextStyle(
                              color: maroon,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'View Details >',
                              style: TextStyle(
                                color: green,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------ Recent Transaction Section ------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Transaction',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Transaction List
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        _transactionTile(
                          title: 'Order #1240 Delivery',
                          subtitle: 'Today, 10:30 AM • CASH',
                          amount: '+ ₹51.90',
                          amountColor: green,
                          tip: '+ ₹5.45 tips',
                        ),
                        Divider(height: 1, color: lightGrey),
                        _transactionTile(
                          title: 'Order #1240 Delivery',
                          subtitle: 'Today, 09:10 AM • CASH',
                          amount: '+ ₹51.90',
                          amountColor: green,
                          tip: '+ ₹5.45 tips',
                        ),
                        Divider(height: 1, color: lightGrey),
                        _transactionTile(
                          title: 'Cash Deposit',
                          subtitle: 'Yesterday, 06:00 PM',
                          amount: '- ₹799',
                          amountColor: maroon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90), // For bottom nav bar spacing
          ],
        ),
      ),
      // ------------------ Bottom Navigation Bar ------------------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: maroon.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: white,
          selectedItemColor: maroon,
          unselectedItemColor: greyText,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() => selectedIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }

  // Helper for transaction tile
  Widget _transactionTile({
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
    String? tip,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
          ),
          if (tip != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                tip,
                style: const TextStyle(fontSize: 12, color: Color(0xFF2ECC40)),
              ),
            ),
        ],
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amountColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
} 
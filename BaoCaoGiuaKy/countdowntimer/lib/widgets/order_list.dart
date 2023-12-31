import 'package:flutter/material.dart';
import 'package:countdowntimer/constants/colors.dart';
import 'package:countdowntimer/primitives/order.dart';
import 'package:countdowntimer/widgets/food_order_card.dart';

class OrderList extends StatelessWidget {
  OrderList({super.key, required this.orders});

  final List<Order> orders;
  final List<Color> colors = [
    AppColors.orangeIconBg,
    AppColors.redIconBg,
    AppColors.greenIconBg,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "YOUR ORDER",
              style: TextStyle(color: AppColors.grey, fontSize: 16.0),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.separated(
              shrinkWrap: false,
              itemBuilder: (context, index) {
                final order = orders[index];
                return FoodOrderCard(
                  title: order.name,
                  price: order.price,
                  multiplier: order.multiplier,
                  rating: order.rating,
                  iconBgColor: colors[index],
                  foodType: order.foodType,
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                );
              },
              itemCount: orders.length,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gareng_front/widgets/account_button.dart';
import 'package:gareng_front/widgets/my_profile_card.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyProfileCard(),
          const SizedBox(
            height: 20,
          ),
          const AccountButton(
              buttonText: 'Food App Plus', icon: Icon(Icons.workspace_premium)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'My Order History', icon: Icon(Icons.list)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'My Subscription', icon: Icon(Icons.calendar_month)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'Payment Methods', icon: Icon(Icons.payment)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'Food Donation', icon: Icon(Icons.card_giftcard)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(buttonText: 'Promos', icon: Icon(Icons.discount)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'For Business', icon: Icon(Icons.business)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(buttonText: 'Help', icon: Icon(Icons.help)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'QnA', icon: Icon(Icons.question_answer)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'Request', icon: Icon(Icons.request_page)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'Customer Service', icon: Icon(Icons.calendar_month)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'My Subscription', icon: Icon(Icons.calendar_month)),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const AccountButton(
              buttonText: 'My Subscription', icon: Icon(Icons.calendar_month)),
        ],
      ),
    );
  }
}

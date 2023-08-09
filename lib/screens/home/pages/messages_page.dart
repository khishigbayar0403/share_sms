import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:share_sms/providers/auth_provider.dart';
// import 'package:share_sms/providers/theme_provider.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);

    return const Column(children: [Message()]);
  }
}

class Message extends StatelessWidget {
  const Message({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              splashColor:
                  Theme.of(context).colorScheme.surfaceTint.withAlpha(14),
              title: Text(
                "133333",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline)),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.outlineVariant,
              ),
            );
          }),
    );
    // Row(
    //   children: [
    //     SizedBox(
    //       width: 80,
    //       child: const CircleAvatar(
    //         radius: 24,
    //         backgroundColor: Colors.grey,
    //       ),
    //     ),
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "133333",
    //             style: Theme.of(context).textTheme.titleMedium,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 16),
    //             child: Text(
    //               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //               style: Theme.of(context).textTheme.bodySmall,
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}

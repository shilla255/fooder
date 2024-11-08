import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorite_model.dart';
import 'favorite_provider.dart';

class FavouriteCardWidget extends ConsumerWidget {
  final FavouriteItem item;

  const FavouriteCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(item.imageUrl, fit: BoxFit.cover, width: 50, height: 50),
        title: Text(item.name),
        subtitle: Text(item.details),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            ref.read(favouriteProvider.notifier).removeFavourite(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.name} removed from favourites')),
            );
          },
        ),
      ),
    );
  }
}
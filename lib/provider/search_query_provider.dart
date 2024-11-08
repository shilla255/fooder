// Remove the SearchBarWidget definition from this file
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider to manage the search query state
final searchQueryProvider = StateProvider<String>((ref) => '');
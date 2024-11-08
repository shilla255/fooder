import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/enums.dart';
import '../../../../main.dart';
import '../../../../provider/filter_provider.dart';
import '../../../../provider/search_query_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  final Function onFilterPressed;

  const SearchBarWidget({super.key, required this.onFilterPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final filterType = ref.watch(filterProvider);
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: screenSize.width * 0.05,
      ),
      child: Container(
        width: double.infinity,
        height: screenSize.height * 0.06,
        decoration: BoxDecoration(
          color: themeMode == ThemeMode.light ? Colors.white : Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: themeMode == ThemeMode.light ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Icon(Icons.search, color: themeMode == ThemeMode.light ? Colors.red : Colors.white, size: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    initialValue: searchQuery,
                    onChanged: (query) {
                      ref.read(searchQueryProvider.notifier).state = query;
                    },
                    decoration: InputDecoration(
                      hintText: "Ungependa kula nini Leo?",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              DropdownButton<FilterType>(
                value: filterType,
                icon: Icon(Icons.arrow_downward, color: themeMode == ThemeMode.light ? Colors.black : Colors.white),
                onChanged: (FilterType? newValue) {
                  if (newValue != null) {
                    ref.read(filterProvider.notifier).state = newValue;
                  }
                },
                items: FilterType.values.map<DropdownMenuItem<FilterType>>((FilterType value) {
                  return DropdownMenuItem<FilterType>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
              ),
              IconButton(
                icon: Icon(Icons.filter_list, size: 20, color: themeMode == ThemeMode.light ? Colors.black : Colors.white),
                onPressed: () {
                  onFilterPressed();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
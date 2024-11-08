import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/enums/enums.dart';

final filterProvider = StateProvider<FilterType>((ref) => FilterType.all);
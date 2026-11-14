import 'package:flutter/material.dart';

import '../../domain/entities/cat_filter.dart';

/// Fila de chips para elegir el filtro de la imagen.
class FilterSelector extends StatelessWidget {
  const FilterSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final CatFilter selected;
  final ValueChanged<CatFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        for (final filter in CatFilter.values)
          ChoiceChip(
            label: Text(filter.label),
            selected: filter == selected,
            onSelected: (_) => onSelected(filter),
          ),
      ],
    );
  }
}

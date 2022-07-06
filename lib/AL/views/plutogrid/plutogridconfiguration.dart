import 'package:pluto_grid/pluto_grid.dart';

PlutoGridConfiguration plutoGridConfiguration() {
  return PlutoGridConfiguration(
    enableColumnBorder: true,
    columnFilterConfig: PlutoGridColumnFilterConfig(
      filters: const [
        ...FilterHelper.defaultFilters,
        // custom filter
      ],
      resolveDefaultColumnFilter: (column, resolver) {
        if (column.field == 'text') {
          return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
        } else if (column.field == 'number') {
          return resolver<PlutoFilterTypeGreaterThan>() as PlutoFilterType;
        } else if (column.field == 'date') {
          return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
        } else if (column.field == 'select') {
          return resolver<ClassYouImplemented>() as PlutoFilterType;
        }

        return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
      },
    ),
  );
}

class ClassYouImplemented implements PlutoFilterType {
  @override
  String get title => 'Custom contains';

  @override
  get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn? column,
      }) {
        var keys = search!.split(',').map((e) => e.toUpperCase()).toList();

        return keys.contains(base!.toUpperCase());
      };

  const ClassYouImplemented();
}

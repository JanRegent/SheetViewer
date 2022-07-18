//------------------------------------------------------------- filterRows
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

final List<PlutoRow> filterRows = [];

void filtersInit(List<String> colsHeader) {
  if (!colsHeader.contains('Mise')) return;
  print(colsHeader);
  PlutoRow filter = PlutoRow(cells: {
    FilterHelper.filterFieldColumn: PlutoCell(
      value: 'Mise',
    ),
    FilterHelper.filterFieldType: PlutoCell(
      value: const PlutoFilterTypeContains(),
    ),
    FilterHelper.filterFieldValue: PlutoCell(
      value: 'ax',
    ),
  });
  filterRows.add(filter);
}

List<PlutoColumn> getFilteredColumns(PlutoGridStateManager gridAStateManager) {
  return gridAStateManager.refColumns.where((e) {
    return gridAStateManager.isFilteredColumn(e);
  }).toList();
}

List<String> getFilteredColsTitles(PlutoGridStateManager gridAStateManager) {
  List<PlutoColumn> filteredCols = gridAStateManager.refColumns.where((e) {
    return gridAStateManager.isFilteredColumn(e);
  }).toList();
  List<String> filteredColsTitles = [];
  for (var i = 0; i < filteredCols.length; i++) {
    filteredColsTitles.add(filteredCols[i].title.toLowerCase());
  }
  return filteredColsTitles;
}

void handleSaveFilter(PlutoGridStateManager gridAStateManager) {
  filterRows.clear();

  final List<PlutoRow> filters = gridAStateManager.filterRows
      .map(
        (e) => PlutoRow(cells: {
          FilterHelper.filterFieldColumn: PlutoCell(
            value: e.cells[FilterHelper.filterFieldColumn]!.value,
          ),
          FilterHelper.filterFieldType: PlutoCell(
            value: e.cells[FilterHelper.filterFieldType]!.value,
          ),
          FilterHelper.filterFieldValue: PlutoCell(
            value: e.cells[FilterHelper.filterFieldValue]!.value,
          ),
        }),
      )
      .toList();
  if (filters.isEmpty) return;
  // rint(filters[0].cells.keys);
  // rint(filters[0].cells['column']!.value);
  // rint(filters[0].cells['type']!.value);
  // rint(filters[0].cells['value']!.value);

  filterRows.addAll(filters);
}

String filteredColumnGetValue(
    PlutoGridStateManager gridAStateManager, String columnName) {
  final List<PlutoRow> filters = gridAStateManager.filterRows
      .map(
        (e) => PlutoRow(cells: {
          FilterHelper.filterFieldColumn: PlutoCell(
            value: e.cells[FilterHelper.filterFieldColumn]!.value,
          ),
          FilterHelper.filterFieldType: PlutoCell(
            value: e.cells[FilterHelper.filterFieldType]!.value,
          ),
          FilterHelper.filterFieldValue: PlutoCell(
            value: e.cells[FilterHelper.filterFieldValue]!.value,
          ),
        }),
      )
      .toList();
  if (filters.isEmpty) return '';
  // rint(filters[0].cells.keys);
  // rint(filters[0].cells['column']!.value);
  // rint(filters[0].cells['type']!.value);
  // rint(filters[0].cells['value']!.value);
  for (var fIx = 0; fIx < filters.length; fIx++) {
    if (filters[fIx].cells['column']!.value == columnName) {
      return filters[fIx].cells['value']!.value.toString();
    }
  }
  return '';
}

void handleLoadFilter(PlutoGridStateManager gridAStateManager) {
  List<PlutoRow> filterRow = [];

  PlutoRow filter = PlutoRow(cells: {
    FilterHelper.filterFieldColumn: PlutoCell(
      value: 'row_',
    ),
    FilterHelper.filterFieldType: PlutoCell(
      value: const PlutoFilterTypeContains(),
    ),
    FilterHelper.filterFieldValue: PlutoCell(
      value: '2',
    ),
  });
  filterRow.add(filter);
  gridAStateManager.gridFocusNode?.unfocus();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    gridAStateManager.setFilterWithFilterRows(filterRow);
  });
}

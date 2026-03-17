// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Controllers
import 'package:parkio/controller/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownMenuEntry> _lots = [
      DropdownMenuEntry(value: "Lot1", label: "Lot 1"),
      DropdownMenuEntry(value: "Lot2", label: "Lot 2"),
      DropdownMenuEntry(value: "Lot3", label: "Lot 3"),
    ];

    final grid = [
      [
        {"type": "P", "name": "P01", "status": "UNOCCUPIED"},
        {"type": "U"},
        {"type": "P", "name": "P02", "status": "OCCUPIED"},
        {"type": "P", "name": "P03", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P04", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P05", "status": "UNOCCUPIED"},
        {"type": "R", "roadType": "E"},
        {"type": "P", "name": "P01", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P01", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P02", "status": "OCCUPIED"},
        {"type": "P", "name": "P03", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P04", "status": "UNOCCUPIED"},
        {"type": "U", "name": "P05", "status": "UNOCCUPIED"},
      ],
      [
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
      ],
      [
        {"type": "P", "name": "P06", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P07", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P08", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P09", "status": "OCCUPIED"},
        {"type": "P", "name": "P10", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P11", "status": "UNOCCUPIED"},
        {"type": "R"},
        {"type": "P", "name": "P06", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P07", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P08", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P09", "status": "OCCUPIED"},
        {"type": "P", "name": "P10", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P11", "status": "UNOCCUPIED"},
      ],
      [
        {"type": "P", "name": "P12", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P13", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P14", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P15", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P16", "status": "OCCUPIED"},
        {"type": "P", "name": "P17", "status": "UNOCCUPIED"},
        {"type": "R"},
        {"type": "P", "name": "P12", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P13", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P14", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P15", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P16", "status": "OCCUPIED"},
        {"type": "P", "name": "P17", "status": "UNOCCUPIED"},
      ],
      [
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
      ],

      [
        {"type": "P", "name": "P18", "status": "OCCUPIED"},
        {"type": "P", "name": "P19", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P20", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P21", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P22", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P23", "status": "UNOCCUPIED"},
        {"type": "R"},
        {"type": "P", "name": "P18", "status": "OCCUPIED"},
        {"type": "P", "name": "P19", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P20", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P21", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P22", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P23", "status": "UNOCCUPIED"},
      ],
      [
        {"type": "P", "name": "P12", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P13", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P14", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P15", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P16", "status": "OCCUPIED"},
        {"type": "P", "name": "P17", "status": "UNOCCUPIED"},
        {"type": "R"},
        {"type": "P", "name": "P12", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P13", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P14", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P15", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P16", "status": "OCCUPIED"},
        {"type": "P", "name": "P17", "status": "UNOCCUPIED"},
      ],
      [
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
        {"type": "R"},
      ],

      [
        {"type": "P", "name": "P18", "status": "OCCUPIED"},
        {"type": "P", "name": "P19", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P20", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P21", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P22", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P23", "status": "UNOCCUPIED"},
        {"type": "R", "roadType": "X"},
        {"type": "P", "name": "P18", "status": "OCCUPIED"},
        {"type": "P", "name": "P19", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P20", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P21", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P22", "status": "UNOCCUPIED"},
        {"type": "P", "name": "P23", "status": "UNOCCUPIED"},
      ],
    ];
    final flatGrid = grid.expand((row) => row).toList();
    final columns = grid[0].length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(HugeIconsStroke.logoutCircle01),
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).signOut();

              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownMenuFormField(
              width: MediaQuery.of(context).size.width,
              dropdownMenuEntries: _lots,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: grid.map((row) {
                      return Row(
                        children: row.map((cell) {
                          return SizedBox(
                            width: 90,
                            height: 90,
                            child: PlotView(
                              plotName: cell["name"] ?? "",
                              plotId: "",
                              plotType: cell["type"],
                              roadType: cell["roadType"],
                              plotStatus: cell["status"],
                            ),
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlotView extends StatelessWidget {
  const PlotView({
    super.key,
    required this.plotName,
    required this.plotId,
    this.plotType,
    this.roadType,
    this.plotStatus,
  });

  final String plotName;
  final String plotId;
  final String? plotType;
  final String? roadType;
  final String? plotStatus;

  Color getColor(BuildContext context) {
    if (plotType == "P" && plotStatus == "UNOCCUPIED") {
      return Theme.of(context).colorScheme.primary;
    }
    if (plotType == "P" && plotStatus == "OCCUPIED") {
      return Theme.of(context).colorScheme.error;
    }
    if (plotType == "R" && roadType == "E") {
      return Colors.blue.shade300.withAlpha(40);
    }
    if (plotType == "R" && roadType == "X") {
      return Colors.amber.shade300.withAlpha(50);
    }
    if (plotType == "R") {
      return Theme.of(context).colorScheme.surfaceContainer;
    }
    if (plotType == "U") {
      return Theme.of(context).colorScheme.surface;
    }

    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: plotType != 'R' ? EdgeInsets.all(4) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: getColor(context),
        borderRadius: plotType == 'R' ? BorderRadius.zero : BorderRadius.circular(8),
      ),
      child: Center(
        child: plotType == 'R'
            ? null
            : Text(plotName, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
      ),
    );
  }
}

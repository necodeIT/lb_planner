class StatusProfile {
  StatusProfile({required this.done, required this.late, required this.uploaded, required this.pending}) {
    total = done + uploaded + late + pending;

    donePercentage = total > 0 ? done / total : 0;
    uploadedPercentage = total > 0 ? uploaded / total : 0;
    latePercentage = total > 0 ? late / total : 0;
    pendingPercentage = total > 0 ? pending / total : 0;
  }

  final int done;
  final int late;
  final int uploaded;
  final int pending;

  late final int total;
  late final double donePercentage;
  late final double uploadedPercentage;
  late final double latePercentage;
  late final double pendingPercentage;
}

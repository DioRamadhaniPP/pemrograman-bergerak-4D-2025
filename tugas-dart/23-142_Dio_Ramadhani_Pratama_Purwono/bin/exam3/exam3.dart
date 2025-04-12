Set uniqueElement(List<int> myList) {
  // TODO 1:
  return myList.toSet();
  // End of TODO 1
}

Map<String, String> buildFutsalPlayersMap() {
  // TODO 2:
  return {
    'Goalkeeper': 'Dio',
    'Anchor': 'waldan',
    'pivot': 'rifky',
    'Right Flank': 'adit',
    'Left Flank': 'adit',
  };
  // End of TODO 2
}

Map<String, String> updatePivotPlayer() {
  final futsalPlayers = buildFutsalPlayersMap();

  // TODO 3:
  futsalPlayers['pivot'] = 'agata'; // Perbaikan
  // End of TODO 3

  return futsalPlayers;
}

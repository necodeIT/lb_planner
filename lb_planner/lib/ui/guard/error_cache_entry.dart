class ErrorCacheEntry {
  ErrorCacheEntry(this.exception, this.stack);

  final String exception;
  final String stack;

  @override
  bool operator ==(other) {
    if (other is! ErrorCacheEntry) return false;

    return stack == other.stack && exception == other.exception;
  }

  @override
  int get hashCode => super.hashCode;
}

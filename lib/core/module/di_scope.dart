abstract interface class DIScope {
  void register();
  Future<void> dispose();
}

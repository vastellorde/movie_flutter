abstract interface class DIScope {
  Future<void> register();
  Future<void> dispose();
}

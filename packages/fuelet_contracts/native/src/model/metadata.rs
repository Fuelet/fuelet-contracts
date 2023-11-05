pub enum Metadata {
    /// Used when the stored metadata is a `u64`.
    Int(u64),
    /// Used when the stored metadata is a `String`.
    String(String),
}

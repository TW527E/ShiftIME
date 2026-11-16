public enum PinyinInputSourceClassifier {
    /// Matches Apple's standard Simplified and Traditional Pinyin modes while
    /// deliberately excluding Zhuyin and other Chinese input modes.
    ///
    /// Only Apple's own input sources qualify. A third-party Pinyin input
    /// method also has "pinyin" in its ID or "拼音" in its name, but it handles
    /// its own shortcuts and must be passed through untouched.
    public static func isApplePinyin(id: String, localizedName: String) -> Bool {
        let normalizedID = id.lowercased()
        // Apple ships Pinyin both as input methods and as keyboard layouts
        // (com.apple.keylayout.TraditionalPinyinKeyboard).
        guard normalizedID.hasPrefix("com.apple.inputmethod.")
            || normalizedID.hasPrefix("com.apple.keylayout.") else { return false }
        return normalizedID.contains("pinyin")
            || normalizedID == "com.apple.inputmethod.scim.itabc"
    }
}

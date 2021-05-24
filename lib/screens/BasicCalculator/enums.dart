enum ActionID {
  AC,
  ChangeTheme,
  Percentage,
  Divide,
  Multiply,
  Subtract,
  Add,
  Plus,
  Equals,
  Backspace,
}

extension ActionIdExtension on ActionID {
  String get symbol {
    switch (this) {
      case ActionID.Divide:
        return "\u00f7";
      case ActionID.Multiply:
        return "\u00d7";
      case ActionID.Subtract:
        return "\u2013";
      case ActionID.Add:
        return "\u002b";
      default:
        print("The default was reached in ActionIdExtension");
        return "";
    }
  }
}

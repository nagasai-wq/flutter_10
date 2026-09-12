# Debugging Log

## Bug 1: Counter Not Incrementing (State Management Issue)
- **Discovery:** Tapping the increment button did not update the counter value on the UI.
- **Debugging Tool Used:** Debug Statements (`print()`) and Console output.
- **Root Cause:** The `onPressed` property of the `FloatingActionButton` was set to `null` instead of referencing `_incrementCounter`.
- **Fix:** Assigned `onPressed: _incrementCounter` to the increment button callback and wrapped state mutations inside `setState()`.

---

## Bug 2: Layout Overflow When Counter Reaches 10+
- **Discovery:** RenderFlex yellow/red striping overflow warnings appeared when testing higher counts.
- **Debugging Tool Used:** Flutter Inspector and `debugPaintSizeEnabled`.
- **Root Cause:** The `Text` widget lacked flex constraints inside the `Column` widget, causing bounds overflow on larger text or narrower screens.
- **Fix:** Wrapped the `Text` widget inside `Flexible` and `FittedBox` widgets with `TextOverflow.ellipsis` to automatically handle constraint bounds.

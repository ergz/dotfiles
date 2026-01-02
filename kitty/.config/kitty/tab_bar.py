# Custom tab bar for kitty - Equal-width tabs with centered titles

from kitty.fast_data_types import Screen, get_boss
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb

_MARKER = ("● ", "○ ")
_FG_COLOR = as_rgb(0xAAAAAA)
_ACTIVE_MARKER_COLOR = as_rgb(0xCC6666)


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    num_tabs = len(get_boss().active_tab_manager.tabs)
    tab_width = screen.columns - before if is_last else screen.columns // num_tabs

    screen.cursor.bg = as_rgb(draw_data.tab_bg(tab))
    screen.cursor.bold = False

    marker = _MARKER[not tab.is_active]
    title = f"{index}:{tab.title}"
    full = marker + title
    max_len = tab_width - 2
    if len(full) > max_len:
        title = title[: max_len - len(marker) - 1] + "…"
        full = marker + title

    pad = tab_width - len(full)
    left = pad // 2
    right = pad - left

    # Draw: left padding + marker (with color switch) + title + right padding
    screen.cursor.fg = _FG_COLOR
    screen.draw(" " * left)
    screen.cursor.fg = _ACTIVE_MARKER_COLOR if tab.is_active else _FG_COLOR
    screen.draw(marker)
    screen.cursor.fg = _FG_COLOR
    screen.draw(title + " " * right)

    return screen.cursor.x

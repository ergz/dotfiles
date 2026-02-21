# Custom tab bar for kitty - Equal-width tabs with centered titles

import re
import socket

from kitty.fast_data_types import Screen, get_boss
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb

_MARKER = ("◉ ", "○ ")
_FG_COLOR = as_rgb(0xAAAAAA)
_ACTIVE_MARKER_COLOR = as_rgb(0xCC6666)

# Host-based tab background colors (add your hosts here)
_HOST_COLORS = {
    "docker-dev": as_rgb(0x414868),    # teide dark purple-gray (color8)
}
_LOCAL_HOSTNAME = socket.gethostname().split(".")[0].lower()


def _get_host_from_title(title: str) -> str | None:
    """Extract hostname from title like 'user@hostname' or 'hostname'."""
    match = re.search(r"(?:^|@)([a-zA-Z0-9_-]+)", title)
    if match:
        return match.group(1).lower()
    return None


def _brighten(color: int, factor: float = 1.4) -> int:
    """Brighten an RGB color by a factor."""
    r = min(255, int(((color >> 16) & 0xFF) * factor))
    g = min(255, int(((color >> 8) & 0xFF) * factor))
    b = min(255, int((color & 0xFF) * factor))
    return (r << 16) | (g << 8) | b


def _get_tab_bg_color(title: str, default_bg: int, is_active: bool) -> int:
    """Return background color based on detected host."""
    host = _get_host_from_title(title)
    if host and host != _LOCAL_HOSTNAME and host in _HOST_COLORS:
        base = _HOST_COLORS[host]
        return _brighten(base) if is_active else base
    return default_bg


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

    default_bg = as_rgb(draw_data.tab_bg(tab))
    screen.cursor.bg = _get_tab_bg_color(tab.title, default_bg, tab.is_active)
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

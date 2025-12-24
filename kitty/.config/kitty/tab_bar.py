# Custom tab bar for kitty - Equal-width tabs with centered titles
# This file is used when `tab_bar_style custom` is set in kitty.conf
# Comment out that line to revert to the default tab bar style

from kitty.fast_data_types import Screen, get_boss, get_options
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int


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
    """
    Draw a single tab with equal width distribution across the tab bar.
    All tabs share the screen width equally, with centered titles.
    """
    # Get number of tabs from boss
    boss = get_boss()
    num_tabs = len(boss.active_tab_manager.tabs)

    # Get colors from draw_data (respects your theme settings)
    tab_bg = as_rgb(draw_data.tab_bg(tab))
    tab_fg = as_rgb(draw_data.tab_fg(tab))
    default_bg = as_rgb(color_as_int(draw_data.default_bg))

    # Marker for active/inactive
    marker = "●" if tab.is_active else "○"

    # Separator styling
    separator = ""
    separator_bg = default_bg
    separator_fg = as_rgb(color_as_int(draw_data.inactive_fg))

    # Calculate equal width for each tab
    # Each tab gets: (screen_width) / num_tabs
    # Non-last tabs lose 1 char for separator
    total_width = screen.columns
    tab_width = total_width // num_tabs

    # Last tab fills remaining space (handles rounding)
    if is_last:
        tab_width = total_width - before

    # Content width (subtract 1 for separator on non-last tabs)
    content_width = tab_width - 1 if not is_last else tab_width

    # Build the tab title with marker
    title = f"{marker} {tab.title}"

    # Truncate if too long (leave room for padding on each side)
    max_title_len = content_width - 2  # 1 space padding on each side minimum
    if max_title_len < 1:
        max_title_len = 1
    if len(title) > max_title_len:
        title = title[: max_title_len - 1] + "…"

    # Calculate padding for centering
    padding_total = content_width - len(title)
    if padding_total < 0:
        padding_total = 0
    padding_left = padding_total // 2
    padding_right = padding_total - padding_left

    # Draw the tab content
    screen.cursor.bg = tab_bg
    screen.cursor.fg = tab_fg

    # Left padding
    if padding_left > 0:
        screen.draw(" " * padding_left)

    # Title with marker
    screen.draw(title)

    # Right padding
    if padding_right > 0:
        screen.draw(" " * padding_right)

    # Draw separator (except for last tab)
    if not is_last:
        screen.cursor.bg = separator_bg
        screen.cursor.fg = separator_fg
        screen.draw(separator)

    return screen.cursor.x

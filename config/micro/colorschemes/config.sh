#!/bin/sh

# ============================================
# Color Palette
# ============================================

black="#0f0f0f"
black2="2f2f2f"
gray="#5f5f5f"
silver="afafaf"
white="ffffff"

red="#ff5555"
green="#50fa7b"
blue="#6272a4"
yellow="#f1fa8c"
cyan="#8be9fd"

# Accent Colors
pink="#ff79c6"
purple="#bd93f9"
orange="#ffb86c"

# Diff Colors
diff_green="#2ea043"
diff_yellow="#d29922"
diff_red="#da3633"


# ============================================
# Generate Colorscheme
# ============================================

cat > ~/.config/micro/colorschemes/default.micro << EOF

# ------------------------------------------
# Default
# ------------------------------------------
color-link default          "$fg,$bg"

# ------------------------------------------
# Syntax Highlighting - Main Groups
# ------------------------------------------
color-link comment          "$gray,$bg"
color-link comment.bright   "$silver,$bg"

color-link identifier       "$cyan,$bg"
color-link identifier.class "$green,$bg"
color-link identifier.macro "$orange,$bg"
color-link identifier.var   "$red,$bg"

color-link constant              "$purple,$bg"
color-link constant.bool         "$purple,$bg"
color-link constant.bool.true    "$green,$bg"
color-link constant.bool.false   "$red,$bg"
color-link constant.number       "$purple,$bg"
color-link constant.specialChar  "$pink,$bg"
color-link constant.string       "$yellow,$bg"
color-link constant.string.url   "underline $blue,$bg"

color-link statement        "$pink,$bg"
color-link preproc          "$pink,$bg"
color-link preproc.shebang  "bold $gray,$bg"

color-link symbol           "$fg,$bg"
color-link symbol.brackets  "$fg,$bg"
color-link symbol.operator  "$pink,$bg"
color-link symbol.tag       "$red,$bg"

color-link type             "$cyan,$bg"
color-link type.keyword     "bold $cyan,$bg"

color-link special          "$orange,$bg"
color-link underlined       "underline $blue,$bg"
color-link todo             "bold $orange,$bg"
color-link error            "bold $red,$bg"
color-link ignore           "$gray,$bg"

# ------------------------------------------
# UI - Statusline
# ------------------------------------------
color-link statusline              "$light_gray,$bg"
color-link statusline.inactive     "$gray,$bg"
color-link statusline.suggestions  "$fg,$bg"

# ------------------------------------------
# UI - Tabbar
# ------------------------------------------
color-link tabbar           "$gray,$bg"
color-link tabbar.active    "$bright_white,$bg"

# ------------------------------------------
# UI - Line Numbers / Gutter
# ------------------------------------------
color-link line-number          "$gray,$bg"
color-link current-line-number  "bold $bright_white,$bg"
color-link cursor-line          "$black2,$black2"

color-link gutter-info      "$cyan,$bg"
color-link gutter-error     "$red,$bg"
color-link gutter-warning   "$yellow,$bg"

# ------------------------------------------
# UI - Selection / Search
# ------------------------------------------
color-link selection        "$bright_white,$blue"
color-link match-brace      "bold $green,$bg"
color-link hlsearch         "$bg,$orange"

# ------------------------------------------
# UI - Diff (Git)
# ------------------------------------------
color-link diff-added       "$diff_green,$bg"
color-link diff-modified    "$diff_yellow,$bg"
color-link diff-deleted     "$diff_red,$bg"

# ------------------------------------------
# UI - Indentation / Whitespace
# ------------------------------------------
color-link indent-char      "$gray,$bg"
color-link tab-error        "$red,$bg"
color-link trailingws       "$red,$bg"

# ------------------------------------------
# UI - Miscellaneous
# ------------------------------------------
color-link color-column     ",$bg"
color-link scrollbar        "$gray,$bg"
color-link divider          "$gray,$bg"
color-link message          "$green,$bg"
color-link error-message    "bold $red,$bg"

EOF

echo "default.micro generated!"

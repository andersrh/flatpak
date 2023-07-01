#!/bin/bash

EXTRA_ARGS=()

declare -i USE_WAYLAND="${USE_WAYLAND:-0}"

if [[ "${USE_WAYLAND}" -eq 1 && "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    EXTRA_ARGS+=(
        "--enable-features=WaylandWindowDecorations"
        "--ozone-platform=wayland"
    )
fi


echo "Debug: Will run Binance Desktop with the following arguments: ${EXTRA_ARGS[@]}"
echo "Debug: Additionally, user gave: $@"

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
exec zypak-wrapper /app/Binance/binance "${EXTRA_ARGS[@]}" "$@"

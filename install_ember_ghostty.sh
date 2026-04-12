#!/bin/bash

# --- Configuration & Paths ---
THEME_NAME="ember"
# Replace this with the RAW URL of your theme file on GitHub
THEME_URL="https://raw.githubusercontent.com/afrolino02/ghostty/main/themes/ember"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
GHOSTTY_THEMES_DIR="$GHOSTTY_CONFIG_DIR/themes"
MAIN_CONFIG="$GHOSTTY_CONFIG_DIR/config"
# The final local path for the theme file
LOCAL_THEME_PATH="$GHOSTTY_THEMES_DIR/$THEME_NAME.conf"

echo "--- Initializing Ember Theme Setup (via curl) ---"

# --- Directory Setup ---
if [ ! -d "$GHOSTTY_THEMES_DIR" ]; then
  echo "Creating Ghostty themes directory..."
  mkdir -p "$GHOSTTY_THEMES_DIR"
fi

# --- Theme Download ---
echo "Downloading Ember theme from GitHub..."
if ! curl -fsSL "$THEME_URL" -o "$LOCAL_THEME_PATH"; then
  echo "Error: Failed to download the theme. Please check the URL or your connection."
  exit 1
fi

# --- Integrity Check ---
# Verify if the downloaded file contains the signature Ember foreground color (#d8d0c0)
echo "Verifying theme color integrity..."
if ! grep -qi "#d8d0c0" "$LOCAL_THEME_PATH"; then
  echo "Warning: The downloaded file doesn't seem to be a valid Ember theme."
  echo "Signature color #d8d0c0 not found. Check the source URL."
  # Optional: rm "$LOCAL_THEME_PATH" (if you want to delete invalid files)
  exit 1
fi

echo "--- Setup Completed Successfully! ---"
echo "Theme saved to: $LOCAL_THEME_PATH"
echo "Ember is now active in your Ghostty config."
echo "Restart Ghostty to see the 'One ember in the ash'."

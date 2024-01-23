#!/bin/bash

# Read input from stdin
input_var=$(cat)

# Docstring:
# This script is intended for use within a text editor environment.
# It reads input from stdin and then uses tmux to send this input to a specified pane.
# If no input is provided, it sends a simple Enter key press to the tmux pane.
# Otherwise, it sends the provided input followed by an Enter key press.
# This is useful for sending commands or text from a text editor to another tmux pane.

# Check if any input is provided
if [ -z "$input_var" ]; then
    # If no input is provided, send an Enter key press to pane 1 in tmux. Useful for python's indentation but not the best solution ever
    tmux send-keys -t 1 Enter >/dev/null 2>&1
fi

# If input is provided, send this input followed by an Enter key press to pane 1 in tmux
tmux send-keys -t 1 "$input_var" Enter >/dev/null 2>&1

# Echo the input for to not replace initially selected text like in helix or vim/neovim
echo "$input_var"

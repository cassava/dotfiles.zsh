# 10-remind-me-notes.zsh
#
# If the shell is a login shell, use the remind_me_notes
# program to show me the contents of ~/NOTES.

# Not on Login...
if [[ ! -o login && $(id -u) -ne 0 ]]; then
    remind_me_notes
fi

# TODO: This is a temporary fix for systemctl while it has it's kdbus transition.
for sd_cmd in systemctl systemd-analyze systemd-run; do
alias $sd_cmd='DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/dbus/user_bus_socket" '$sd_cmd
done

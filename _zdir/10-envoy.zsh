# if envoy is installed, start and bind it in the current shell
if type envoy &>/dev/null; then
    envoy
    source <(envoy -p)
fi

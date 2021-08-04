install -d -m 700 ~/.ssh
KEYS=$(sudo -S cat /root/.ssh/authorized_keys)
keys_dir=~/.ssh/authorized_keys
echo "$KEYS" > "$keys_dir"
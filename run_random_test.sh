cat << 'EOF' > /home/ash/splunk-ssh-monitor/run_random_test.sh
#!/bin/bash
ATOMICS_DIR="$HOME/AtomicRedTeam/atomics"

if [ ! -d "$ATOMICS_DIR" ]; then
    echo "Error: Atomics directory not found at $ATOMICS_DIR"
    exit 1
fi

# Pick a random technique folder
RANDOM_TECHNIQUE=$(ls -1 "$ATOMICS_DIR" | shuf -n 1)

echo "=========================================="
echo "Selected Random Technique: $RANDOM_TECHNIQUE"
echo "=========================================="

# Execute it via PowerShell
pwsh -Command "Invoke-AtomicTest $RANDOM_TECHNIQUE"
EOF

chmod +x /home/ash/splunk-ssh-monitor/run_random_test.sh

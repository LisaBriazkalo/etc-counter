if [ ! -d "/etc" ]; then
    echo "The /etc directory does not exist."
    exit 1
fi

file_count=$(find /etc -type f | wc -l)
echo "The number of files in /etc (excluding directories and links) is: $file_count"

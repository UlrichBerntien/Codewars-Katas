latest=""
for fn in *.txt; do
    if [[ -z "$latest" ]] || [[ "$fn" -nt "$latest" ]]; then
        latest="$fn"
    fi
done
echo "$latest"
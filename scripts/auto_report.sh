#!/usr/bin/env sh
set -u
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
LOG_FILE="$ROOT/data/log-he-thong.log"
REPORT_FILE="$ROOT/backup/bao-cao-su-co.txt"

if [ ! -r "$LOG_FILE" ]; then
  printf 'Khong tim thay hoac khong doc duoc tep log: %s\n' "$LOG_FILE" >&2
  exit 1
fi
mkdir -p "$ROOT/backup"
{
  printf '\n===== BAO CAO SU CO HE THONG =====\n'
  printf 'Thoi gian chay: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %z')"
} >> "$REPORT_FILE"

grep -Ei 'CRITICAL|ERROR|TIMEOUT' "$LOG_FILE" >> "$REPORT_FILE"
status=$?
if [ "$status" -eq 1 ]; then
  printf 'Khong tim thay dong CRITICAL, ERROR hoac TIMEOUT.\n' >> "$REPORT_FILE"
elif [ "$status" -gt 1 ]; then
  printf 'Loi khi doc/loc tep log.\n' >&2
  exit 2
fi
printf 'Hoan tat loc log. Bao cao: %s\n' "$REPORT_FILE"
exit 0

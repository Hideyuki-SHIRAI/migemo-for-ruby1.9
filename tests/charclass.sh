#! /bin/sh

#
# charclass test
#

echo sym | ruby -I.. ../migemo  --nocache test-dict > tmp.out
cat <<'EOF' > tmp.right
[]$%@\\-]|sym
EOF
cmp tmp.right tmp.out || exit 1

echo sym | ruby -I.. ../migemo -temacs  --nocache test-dict > tmp.out
cat <<'EOF' > tmp.right
[]$%@\-]\|sym
EOF
cmp tmp.right tmp.out || exit 1

exit 0

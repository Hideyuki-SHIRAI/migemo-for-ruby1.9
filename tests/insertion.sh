#! /bin/sh

#
# insertion test
#
echo "mot"| ruby -I.. ../migemo -temacs -i"\\s *" -n test-dict > tmp.out
cat <<'EOF' > tmp.right
m\s *o\s *t\|��\s *��\s *��\|��\s *[�����äĤƤ�]\|��\s *\([�����åĥƥ�]\|��\s *\(��\s *��\s *��\|��\s *��\)\|��\s *��\)
EOF
cmp tmp.right tmp.out || exit 1

echo "mot"| ruby -I.. ../migemo -i"\\s *" -n test-dict > tmp.out
cat <<'EOF' > tmp.right
m\s *o\s *t|��\s *��\s *��|��\s *[�����äĤƤ�]|��\s *(?:[�����åĥƥ�]|��\s *(?:��\s *��\s *��|��\s *��)|��\s *��)
EOF
cmp tmp.right tmp.out || exit 1

exit 0

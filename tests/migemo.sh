#! /bin/sh

#
# ordinary cases
#
echo "" | ruby -I.. ../migemo -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right

EOF
cmp tmp.right tmp.out || exit 1

echo "k" | ruby -I.. ../migemo -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
[k�뤫���������å����������õ�����]
EOF
cmp tmp.right tmp.out || exit 1

echo ki| ruby -I.. ../migemo -n -O0 test-dict > tmp.out
cat <<'EOF' > tmp.right
ki|���|��|��|��|��|��|��ǽ|��Ǽ|����|��ǽ���|��ǽŪ|��ǼŪ
EOF
cmp tmp.right tmp.out || exit 1

echo ki| ruby -I.. ../migemo -n -O1 test-dict > tmp.out
cat <<'EOF' > tmp.right
ki|���|��|��|��|��|��
EOF
cmp tmp.right tmp.out || exit 1

echo ki| ruby -I.. ../migemo -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
[����������]|ki|���
EOF
cmp tmp.right tmp.out || exit 1

echo kin| ruby -I.. ../migemo -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
kin|����|��[�äʤˤ̤ͤΤ�]|��[�åʥ˥̥ͥΥ�]|��ǽ|��[Ǽ��]
EOF
cmp tmp.right tmp.out || exit 1

echo mot| ruby -I.. ../migemo -n -O2 test-dict > tmp.out
cat <<'EOF' > tmp.right
mot|����|��(?:��|��|��|��|��|��)|��(?:��(?:�����|����)|����|��|��|��|��|��|��)
EOF
cmp tmp.right tmp.out || exit 1

echo mot| ruby -I.. ../migemo -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
mot|����|��[�����äĤƤ�]|��(?:[�����åĥƥ�]|��(?:�����|����)|����)
EOF
cmp tmp.right tmp.out || exit 1

exit 0

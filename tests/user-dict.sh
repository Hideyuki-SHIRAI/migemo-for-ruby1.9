#! /bin/sh

#
# user dictionary test
#
export USERDICT=../user-dict.sample
export REGEXDICT=../regex-dict.sample

echo "mot" | ruby -I.. ../migemo -u $USERDICT -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
mot|����|��[�����äĤƤ�]|��(?:[�����åĥƥ�]|��(?:�����|����)|����)|Message Of The Day
EOF
cmp tmp.right tmp.out || exit 1

echo "c" | ruby -I.. ../migemo -u $USERDICT -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
[c����å���]|Sony CSL|���ˡ�(?:CSL|����ԥ塼���������󥹸����)
EOF
cmp tmp.right tmp.out || exit 1

echo "nais" | ruby -I.. ../migemo -u $USERDICT -n -O3 test-dict > tmp.out
cat <<'EOF' > tmp.right
nais|�����|�ʤ�[������������]|�ʥ�[������������]|������ü(?:��|�ʳص�����ر����)
EOF
cmp tmp.right tmp.out || exit 1

exit 0

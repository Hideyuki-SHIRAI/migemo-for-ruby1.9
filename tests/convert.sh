#! /bin/sh

cat > tmp.convert.input <<EOF
;;
;; This is a comment line.
;;
�꤫�� /����/
�꤫��s /����/
motion /�⡼�����/
�꤯�Ȥ� /ϻ��;�ͤ����٤�ϻ�Ĥ������֤��Ȥ��פȤ�/
EOF

cat > tmp.convert.output <<EOF
;;
;; This is Migemo's dictionary generated from SKK's.
;;
;;
;; This is a comment line.
;;
motion	�⡼�����
�꤫��	����
�꤯�Ȥ�	ϻ��
EOF

cat tmp.convert.input | ruby ../migemo-convert.rb > tmp.convert.tmp
cmp tmp.convert.output tmp.convert.tmp || exit 1
exit 0

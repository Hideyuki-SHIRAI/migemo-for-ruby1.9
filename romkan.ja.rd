=begin
= Ruby/Romkan: ���޻��ȤҤ餬�ʤ���ߤ��Ѵ����� Ruby�ѤΥ饤�֥��

Ruby/Romkan �ϥ��޻��ȤҤ餬�ʤ���ߤ��Ѵ����� Ruby �ѤΥ饤�֥��Ǥ�����
�޻���ʸ������Ҥ餬�ʤ�ʸ������Ѵ�������Ӥ���ȿ�Ф�Ԥ����Ȥ��Ǥ��ޤ���

�ǿ��Ǥ� ((<URL:http://namazu.org/~satoru/ruby-romkan/>))
���������ǽ�Ǥ���

== ʸ��������

Ruby ��ʸ�������ɤ� EUC-JP �����ꤷ�ޤ��� $KCODE="e"

== API

--- String#to_kana
    ���ἰ�ޤ��ϥإܥ󼰤Υ��޻����Ҥ餬�ʤ�ʸ������Ѵ�����

--- String#to_roma
    �Ҥ餬�ʤ�ʸ�����إܥ󼰤Υ��޻�����Ѵ�����

--- String#to_hepburn
    ���ἰ�Υ��޻����إܥ󼰤Υ��޻�����Ѵ�����

--- String#to_kunrei
    �إܥ󼰤Υ��޻�����ἰ�Υ��޻�����Ѵ�����

--- String#to_kana!
    �˲�Ū�� String#to_kana.

--- String#to_roma!
    �˲�Ū�� String#to_roma.

--- String#to_hepburn!
    �˲�Ū�� String#to_hepburn.

--- String#to_kunrei!
    �˲�Ū�� String#to_kunrei.

--- String#consonant?
    self ���Ҳ��ʤ� true ���֤�

--- String#vowel?
    self ���첻�ʤ� true ���֤�

--- String#expand_consonant
    self �������λҲ���Ÿ������
    e.g. "z".expand_consonant => ["za", "ze", "zi", "zo", "zu"]
=== ������

  % irb
  irb(main):001:0> $KCODE="e"
  "e"
  irb(main):002:0> require 'romkan'
  true
  irb(main):003:0> "syatyou".to_kana
  "������礦"
  irb(main):004:0> "������礦".to_roma
  "shachou"
  irb(main):005:0> "syatyou".to_hepburn
  "shachou"

=== ���������

Ruby �Υ饤���󥹤˽��ä��ե꡼���եȥ������Ȥ��Ƹ������ޤ���
������̵�ݾڤǤ���

  * ((<URL:http://namazu.org/~satoru/ruby-romkan/ruby-romkan-0.3.tar.gz>))
  * ((<URL:http://cvs.namazu.org/ruby-romkan/>))

satoru@namazu.org
=end

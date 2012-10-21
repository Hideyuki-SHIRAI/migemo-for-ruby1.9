=begin
= Ruby/Migemo: ���޻��Τޤ����ܸ�򥤥󥯥��󥿥븡������ Ruby�ѤΥ饤�֥��
Ruby/Migemo �ϥ��޻��Τޤ����ܸ�򥤥󥯥��󥿥븡������
����Υ饤�֥��Ǥ���

�ǿ��Ǥ� ((<URL:http://migemo.namazu.org/>)) ���������ǽ��
����

== ʸ��������

Ruby ��ʸ�������ɤ� EUC-JP �����ꤷ�ޤ��� $KCODE="e"

=== ������

  % cat sample.rb
  $KCODE="e"
  require 'migemo'

  dict = MigemoStaticDict.new("migemo-dict")
  dict_cache  = MigemoDictCache.new("migemo-dict" + ".cache")
  user_dict = MigemoUserDict.new("user-dict")

  while line = gets
    pattern = line.chomp
    migemo = Migemo.new(dict, pattern)
    migemo.optimization = 3
    migemo.dict_cache = dict_cache
    migemo.user_dict = user_dict
    migemo.type = "ruby"
    puts migemo.regex
  end

== API

--- MigemoStaticDict#new(filename)
    ��Ū�ʼ���Υ��֥������Ȥ���������

--- MigemoDictCache#new(filename)
    ��Ū�ʼ���Υ���å���Υ��֥������Ȥ���������

--- MigemoUserDict#new(filename)
    �桼������Υ��֥������Ȥ���������

--- MigemoRegexDict#new(filename)
    ����ɽ������Υ��֥������Ȥ���������

--- Migemo#new(dict, pattern)
    Migemo���֥������Ȥ��������롣dict �ˤ�
    MigemoStaticDict ���֥������Ȥ�pattern �ˤϸ����ѥ���
    ���Ϳ����

--- Migemo#regex
    �����ѥ������Ÿ����������ɽ����ʸ������֤���

--- Migemo#type
    ����ɽ���μ��� (emacs, ruby, perl) �����ꤹ�� accessor��[ruby]

--- Migemo#dict_cache
    ��Ū����Υ���å�������ꤹ�� accessor��

--- Migemo#usr_dict
    �桼������Υ��֥������Ȥ����ꤹ�� accessor��

--- Migemo#regex_dict
    ����ɽ������Υ��֥������Ȥ����ꤹ�� accessor��

--- Migemo#insertion
    1ʸ�����Ȥ˶���ʸ��������ꤹ�� accessor��

--- Migemo#optimization
    ����ɽ���Υ���ѥ��Ȳ��Υ�٥� (0-3) �����ꤹ�� accessor��[3]

satoru@namazu.org
=end

# -*- encoding:euc-jp -*-#
# Ruby/Romkan - a Romaji <-> Kana conversion library for Ruby.
#
# Copyright (C) 2001 Satoru Takabayashi <satoru@namazu.org>
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the Ruby's licence.
#
# NOTE: Ruby/Romkan can work only with EUC_JP encoding. ($KCODE="e")
#

module Romkan
  VERSION = '0.4'
end

class Array
  def pairs(s=2)
    0.step(self.size-1,s){
      |x| yield self.slice(x,s)
    }
  end
end
	
class String
# This table is imported from KAKASI <http://kakasi.namazu.org/> and modified.
  KUNREITAB = "\
��	xa	��	a	��	xi	��	i	��	xu
��	u	����	vu	������	va	������	vi 	������	ve
������	vo	��	xe	��	e	��	xo	��	o 

��	ka	��	ga	��	ki	����	kya	����	kyu 
����	kyo	��	gi	����	gya	����	gyu	����	gyo 
��	ku	��	gu	��	ke	��	ge	��	ko
��	go 

��	sa	��	za	��	si	����	sya	����	syu 
����	syo	��	zi	����	zya	����	zyu	����	zyo 
��	su	��	zu	��	se	��	ze	��	so
��	zo 

��	ta	��	da	��	ti	����	tya	����	tyu 
����	tyo	��	di	�¤�	dya	�¤�	dyu	�¤�	dyo 

��	xtu 
�ä���	vvu	�ä�����	vva	�ä�����	vvi 
�ä�����	vve	�ä�����	vvo 
�ä�	kka	�ä�	gga	�ä�	kki	�ä���	kkya 
�ä���	kkyu	�ä���	kkyo	�ä�	ggi	�ä���	ggya 
�ä���	ggyu	�ä���	ggyo	�ä�	kku	�ä�	ggu 
�ä�	kke	�ä�	gge	�ä�	kko	�ä�	ggo	�ä�	ssa 
�ä�	zza	�ä�	ssi	�ä���	ssya 
�ä���	ssyu	�ä���	ssho 
�ä�	zzi	�ä���	zzya	�ä���	zzyu	�ä���	zzyo 
�ä�	ssu	�ä�	zzu	�ä�	sse	�ä�	zze	�ä�	sso 
�ä�	zzo	�ä�	tta	�ä�	dda	�ä�	tti 
�ä���	ttya	�ä���	ttyu	�ä���	ttyo	�ä�	ddi 
�ä¤�	ddya	�ä¤�	ddyu	�ä¤�	ddyo	�ä�	ttu 
�ä�	ddu	�ä�	tte	�ä�	dde	�ä�	tto	�ä�	ddo 
�ä�	hha	�ä�	bba	�ä�	ppa	�ä�	hhi 
�äҤ�	hhya	�äҤ�	hhyu	�äҤ�	hhyo	�ä�	bbi 
�äӤ�	bbya	�äӤ�	bbyu	�äӤ�	bbyo	�ä�	ppi 
�äԤ�	ppya	�äԤ�	ppyu	�äԤ�	ppyo	�ä�	hhu 
�äդ�	ffa	�äդ�	ffi	�äդ�	ffe	�äդ�	ffo 
�ä�	bbu	�ä�	ppu	�ä�	hhe	�ä�	bbe	�ä�    ppe
�ä�	hho	�ä�	bbo	�ä�	ppo	�ä�	yya	�ä�	yyu 
�ä�	yyo	�ä�	rra	�ä�	rri	�ä��	rrya 
�ä��	rryu	�ä��	rryo	�ä�	rru	�ä�	rre 
�ä�	rro 

��	tu	��	du	��	te	��	de	��	to
��	do 

��	na	��	ni	�ˤ�	nya	�ˤ�	nyu	�ˤ�	nyo 
��	nu	��	ne	��	no 

��	ha	��	ba	��	pa	��	hi	�Ҥ�	hya 
�Ҥ�	hyu	�Ҥ�	hyo	��	bi	�Ӥ�	bya	�Ӥ�	byu 
�Ӥ�	byo	��	pi	�Ԥ�	pya	�Ԥ�	pyu	�Ԥ�	pyo 
��	hu	�դ�	fa	�դ�	fi	�դ�	fe	�դ�	fo 
��	bu	��	pu	��	he	��	be	��	pe
��	ho	��	bo	��	po 

��	ma	��	mi	�ߤ�	mya	�ߤ�	myu	�ߤ�	myo 
��	mu	��	me	��	mo 

��	xya	��	ya	��	xyu	��	yu	��	xyo
��	yo

��	ra	��	ri	���	rya	���	ryu	���	ryo 
��	ru	��	re	��	ro 

��	xwa	��	wa	��	wi	��	we
��	wo	��	n 

��     n'
�Ǥ�   dyi
��     -
����    tye
�ä���	ttye
����	zye
"

  HEPBURNTAB = "\
��	xa	��	a	��	xi	��	i	��	xu
��	u	����	vu	������	va	������	vi	������	ve
������	vo	��	xe	��	e	��	xo	��	o
	

��	ka	��	ga	��	ki	����	kya	����	kyu
����	kyo	��	gi	����	gya	����	gyu	����	gyo
��	ku	��	gu	��	ke	��	ge	��	ko
��	go	

��	sa	��	za	��	shi	����	sha	����	shu
����	sho	��	ji	����	ja	����	ju	����	jo
��	su	��	zu	��	se	��	ze	��	so
��	zo

��	ta	��	da	��	chi	����	cha	����	chu
����	cho	��	di	�¤�	dya	�¤�	dyu	�¤�	dyo

��	xtsu	
�ä���	vvu	�ä�����	vva	�ä�����	vvi	
�ä�����	vve	�ä�����	vvo	
�ä�	kka	�ä�	gga	�ä�	kki	�ä���	kkya	
�ä���	kkyu	�ä���	kkyo	�ä�	ggi	�ä���	ggya	
�ä���	ggyu	�ä���	ggyo	�ä�	kku	�ä�	ggu	
�ä�	kke	�ä�	gge	�ä�	kko	�ä�	ggo	�ä�	ssa
�ä�	zza	�ä�	sshi	�ä���	ssha	
�ä���	sshu	�ä���	ssho	
�ä�	jji	�ä���	jja	�ä���	jju	�ä���	jjo	
�ä�	ssu	�ä�	zzu	�ä�	sse	�ä�	zze	�ä�	sso
�ä�	zzo	�ä�	tta	�ä�	dda	�ä�	cchi	
�ä���	ccha	�ä���	cchu	�ä���	ccho	�ä�	ddi	
�ä¤�	ddya	�ä¤�	ddyu	�ä¤�	ddyo	�ä�	ttsu	
�ä�	ddu	�ä�	tte	�ä�	dde	�ä�	tto	�ä�	ddo
�ä�	hha	�ä�	bba	�ä�	ppa	�ä�	hhi	
�äҤ�	hhya	�äҤ�	hhyu	�äҤ�	hhyo	�ä�	bbi	
�äӤ�	bbya	�äӤ�	bbyu	�äӤ�	bbyo	�ä�	ppi	
�äԤ�	ppya	�äԤ�	ppyu	�äԤ�	ppyo	�ä�	ffu	
�äդ�	ffa	�äդ�	ffi	�äդ�	ffe	�äդ�	ffo	
�ä�	bbu	�ä�	ppu	�ä�	hhe	�ä�	bbe	�ä�	ppe
�ä�	hho	�ä�	bbo	�ä�	ppo	�ä�	yya	�ä�	yyu
�ä�	yyo	�ä�	rra	�ä�	rri	�ä��	rrya	
�ä��	rryu	�ä��	rryo	�ä�	rru	�ä�	rre	
�ä�	rro	

��	tsu	��	du	��	te	��	de	��	to
��	do	

��	na	��	ni	�ˤ�	nya	�ˤ�	nyu	�ˤ�	nyo
��	nu	��	ne	��	no	

��	ha	��	ba	��	pa	��	hi	�Ҥ�	hya
�Ҥ�	hyu	�Ҥ�	hyo	��	bi	�Ӥ�	bya	�Ӥ�	byu
�Ӥ�	byo	��	pi	�Ԥ�	pya	�Ԥ�	pyu	�Ԥ�	pyo
��	fu	�դ�	fa	�դ�	fi	�դ�	fe	�դ�	fo
��	bu	��	pu	��	he	��	be	��	pe
��	ho	��	bo	��	po	

��	ma	��	mi	�ߤ�	mya	�ߤ�	myu	�ߤ�	myo
��	mu	��	me	��	mo

��	xya	��	ya	��	xyu	��	yu	��	xyo
��	yo	

��	ra	��	ri	���	rya	���	ryu	���	ryo
��	ru	��	re	��	ro	

��	xwa	��	wa	��	wi	��	we
��	wo	��	n	

��     n'
�Ǥ�   dyi
��     -
����    che
�ä���	cche
����	je
"

  KANROM = (kanaroma = Hash.new
	    (KUNREITAB + HEPBURNTAB).split(/\s+/).pairs {|x|
	      kana, roma = x
	      kanaroma[kana] = roma
	    }
	    kanaroma)

  ROMKAN = (romakana = Hash.new
	    (KUNREITAB + HEPBURNTAB).split(/\s+/).pairs {|x|
	      kana, roma = x
	      romakana[roma] = kana
	    }
	    romakana)

  # Sort in long order so that a longer Romaji sequence precedes.
  ROMPAT = ROMKAN.keys.sort {|a, b| b.length <=> a.length}.join "|"

  KANPAT = KANROM.keys.sort {|a, b| 
    b.length <=> a.length ||
      KANROM[a].length <=> KANROM[b].length
  }.join "|"

  KUNREI  = (i = 0; KUNREITAB. split(/\s+/).select {i += 1; i % 2 == 0})
  HEPBURN = (i = 0; HEPBURNTAB.split(/\s+/).select {i += 1; i % 2 == 0})

  KUNPAT = KUNREI.sort  {|a, b| b.length <=> a.length }.join "|"
  HEPPAT = HEPBURN.sort {|a, b| b.length <=> a.length }.join "|"

  TO_HEPBURN = (romrom = Hash.new
		KUNREI.each_with_index {|x, i|
		  romrom[KUNREI[i]] = HEPBURN[i]}
		romrom)

  TO_KUNREI =  (romrom = Hash.new
		HEPBURN.each_with_index {|x, i|
		  romrom[HEPBURN[i]] = KUNREI[i]}
		romrom)

  # FIXME: ad hod solution
  # tanni   => tan'i
  # kannji  => kanji
  # hannnou => han'nou
  # hannnya => han'nya
  def normalize_double_n
    self.gsub(/nn/, "n'").gsub(/n\'(?=[^aiueoyn]|$)/, "n")
  end

  def normalize_double_n!
    self.gsub!(/nn/, "n'")
    self.gsub!(/n\'(?=[^aiueoyn]|$)/, "n")
    self
  end

  # Romaji -> Kana
  # It can handle both Hepburn and Kunrei sequences.
  def to_kana 
    tmp = self.normalize_double_n
    tmp.gsub(/(#{ROMPAT})/) { ROMKAN[$1] }
  end

  # Kana -> Romaji.  
  # Return Hepburn sequences.
  def to_roma
    tmp = self.gsub(/(#{KANPAT})/) { KANROM[$1] }
    tmp.gsub(/n'(?=[^aeiuoyn]|$)/, "n")
  end

  # Romaji -> Romaji
  # Normalize into Hepburn sequences.
  # e.g. kannzi -> kanji, tiezo -> chiezo
  def to_hepburn
    tmp = self.normalize_double_n
    tmp.gsub(/\G((?:#{HEPPAT})*?)(#{KUNPAT})/) { $1 + TO_HEPBURN[$2]}
  end

  # Romaji -> Romaji
  # Normalize into Kunrei sequences.
  # e.g. kanji -> kanzi, chiezo -> tiezo
  def to_kunrei
    tmp = self.normalize_double_n
    tmp.gsub(/\G((?:#{KUNPAT})*?)(#{HEPPAT})/) { $1 + TO_KUNREI[$2]}
  end

  def to_kana!
    self.normalize_double_n!
    self.gsub!(/(#{ROMPAT})/) { ROMKAN[$1] }
    self
  end

  def to_roma!
    self.gsub!(/(#{KANPAT})/) { KANROM[$1] }
    self.gsub!(/n'(?=[^aeiuoyn]|$)/, "n")
    self
  end

  def to_hepburn!
    self.normalize_double_n!
    self.gsub!(/\G((?:#{HEPPAT})*?)(#{KUNPAT})/) { $1 + TO_HEPBURN[$2]}
    self
  end

  def to_kunrei!
    tmp = self.normalize_double_n!
    tmp.gsub!(/\G((?:#{KUNPAT})*?)(#{HEPPAT})/) { $1 + TO_KUNREI[$2]}
  end

  def consonant?
    if /^[ckgszjtdhfpbmyrwxn]$/.match(self)
      true
    else
      false
    end
  end

  def vowel?
    if /^[aeiou]$/.match(self)
      true
    else
      false
    end
  end

  # `z' => (za ze zi zo zu)
  def expand_consonant 
    ROMKAN.keys.select do |x|
      /^#{self}.$/ =~ x 
    end
  end
end


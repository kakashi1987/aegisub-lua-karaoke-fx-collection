----<><><><><><><><><><><><>---<><><><><><><><><><>---<><><><><><><><><><>---
--Copyright (c) 2009_Esmaeel almansoori_(~alkoon_Universo~)_ al-koon-11@hotmail.com
--http://jnazh-karaoke.ahlamontada.net/forum.htm
----<><><><><><><><><><><><>---<><><><><><><><><><>---<><><><><><><><><><>---
-- ��� ���� ������ ������.
-- ��� ������ ��� ����� ��� ����� ��������� ( ������� �� ������ ��� ������ ) �
-- ��� ������� ���� ��� ����� �����.
-- ��� ���� ������ ����� �������� ����� ������� ����� �� �������.
-- ��� ������ �� �����ǡ ��� ����� ����� �� ����� ������ ���� �����.
-- Ass Draw ��� ����� ������� ���� ���� ��� ����� ����� ���� ������ 
----<><><><><><><><><><><><>---<><><><><><><><><><>---<><><><><><><><><><>---

---XxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxX--XxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx---
--## -- �� ��� ���� ��� ���� ����� (�� ��� ������� ) ��� ��� ���� ���� �� ���� ��� ��������� ������ --##--
---XxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxX--XxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx---

--# �� ������ ������ ������� ������� ���� ����� ��� ������� � ����� ����� ���� ����� ���� ��������� ������� ������ ������� ��������� �������� �������� ������ �� ������� �������� ������ 
include("karaskel.lua")
 
------------------------------------XxXxXxXxXxXxXxXxXxX--------------------------XxXxXxXxXxXxXxXxXxX----------------------------------------------
script_name = "Future Windy Blur" --# ��� �������
script_description = "Highlights blown away by the winds of change." --# ��� �������
script_author = "jfs.(FX'ALKOON')" --# ���� ������� �� ������ 

---# ���� ������ �� ������� ���� ������ ������� #---
script_modified = "alkoon_9:33_Thursday_ PM 8/6/2009" --# ���� �������
script_lesson = "alkoon" --# ��� ���� ����� -- ��� ���� ���� ������ ������� ���� ��� ���������� ������
-----------------------------------XxXxXxXxXxXxXxXxXxX--------------------------XxXxXxXxXxXxXxXxXxX----------------------------------------------


--## ���� ������ ������ �� ������ ������ ��  karaskel-outo4 ����� ������� ��� ��� ������� ���� ����� ��� � ��� ������ ����� ����� ������ 
function new_windy_blur(subs) -- subtitles - ass ���� : ���� ��� ����� ������� ���� ������� �������� ������ �
	aegisub.progress.task("Applying effect...") --  ���� ����� ������ �� �� (����� ������� ) �
	local meta, styles = karaskel.collect_head(subs)	
	local i, ai, maxi, maxai = 1, 1, #subs, #subs --# ����� ��������

--[[
local i, ai, maxi, maxai = 1, 1,
ass  �� ������� ����� ��� ���� ��� ��������� ����� ��  
subs :  ������� ��� �� ��� ������� ��������� ������ ���� ��� �������
# : ��� ������� (����) ����� ���� ��� ��������� �� ������� ����� �� ������ ������ ��� ������ ������� ����� ���� ������ ������
]]--
	while i <= maxi do --# �� ����� �������� �����
	aegisub.progress.task(string.format("Applying effect (%d,%d)", ai, maxai)) -- ass ������� ����� ������ ��� �������(�� �������) �������� ��� ��� 
 --# ����� ����� ����� �� ������ - ������ �� ���� ������ ������� �� ��� �� ��� ��� ����� ������ ����� ��� �������� ������ ������ ���� ����� ���� ���� ������ ��� ��		
aegisub.progress.set((ai-1)/maxai*100) --# �� ���� ����� ����� ���� ����� ����� ������ �� ������� 
--# aegisub.progress.set(percent"100") 
--#Set the position of the percent-done bar in the progress window.
		local l = subs[i] --��� ������ ������ : �� ���� ������� ������ (������) �������� ������ ��� ������� ����� ����


--[[	
 -->> line is l��� �� ����� ������
������� ��� ������ ������� ���� �� (������ )���� ������� ������ ��� ����� ����� ��� ������� ������ ������� �������� ����� ���� ������ 

                  *Effect--->line.text = string.format("{\\pos(%d,%d)\\an5\\fad(100,0)}%s", line.left+syl.center, line.middle, syl.text )
	*timer op--->line.start_time=line.start_time-100 + Universo
	*timer end--->line.end_time=line.start_time+syl.start_time
	*layer--->line.layer = 1

local l = subs[i] --��� ��� ����� ��� ������ ������ : �� ���� ������� �������������� ������ ��� ������� ����� ����

]]--
--#if l.class == "dialogue" ��� ������ ���� �������	              
--# not l.comment  : ������ ��� ��� ������������ ����� �� ����� ��������� ����� ���� "dialogue " ��� ��� ����� ���� �� ������� ����� 
--#not l.comment  then : ����� �� ������ �� ��� ���� ��� ���� ������� �� ��� ����� ^^ � 

		if l.class == "dialogue" and  not l.comment then 
                                    --#�� ���� ������� �� ��� "������� " �  ass ���� ������ ����� :���� ������� ������ �������� �� ��� 
                                   --#  function do_fx(subs, meta, line)
		karaskel.preproc_line(subs, meta, styles, l)
		do_fx(subs, meta, l) 
	                  maxi = maxi - 1
	                 subs.delete(i) --# ���� ����� �������

--[[ subs.delete(i)
  ���� �������( ��� ������� �������) �� ����� ����� ����� ����..��� ���� ���� ������� ����� ���� ���� ���� ����� 
������� �� ������ (������ ^^ ) ���� ���� �� ����� ����� ( �� ���� ����� ������� ������ ) �� ���� ��� ��������� ������� ����� ��������  
���� ����� ����� ����� ���� � ��� ���� ����� �� ������ ��� ����� .. ������: �� ���� ��� ����� ����� ������� �� ����� ���� ��������� 
���� ���� ���� ��� ����� ��� � ������� �� ���� ����� ��� ����� ������
[[ subs.delete(i)  ����� ��� 
	                 else
		i = i + 1
		end
		ai = ai + 1
	end
end
-- ������ ���� ������ ������� ������ ��� ������ , ������ ����� ������ ���� ����� ������ ����
-- i (���� ��� ��� ����-1) - 
--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--

                 function do_fx(subs, meta, line)
	for i = 1, line.kara.n do
local l = line --# ��� ���� ������ �� ���� ������� ��� �� ���� ( line ) ����� (l)  ������ �� ���� �������� ����� ��� �������� ����� ����� ���� ������� �� 
--[[ <<-----
 �� ���� ����� ������� ������ ������ <<--
local syl = line.kara[i]
]]
local syl = l.kara[i]

if i == 1 then Universo = 0 --#  ����� ��� ���� ���� ��� ���� ���� �������
end
--[[  ��� ������ ���� ���������� ����
if i == 1 then 
tiempo = 0
end
�������� �� ��� (����) �� ������ ���� ����� ����
]]--

--------------------------------------##--------------------------------------##--------------------------------------##
--------------------------------------##--------------------------------------##--------------------------------------##
-- ��� ���� ����� ��������� ���� ����� ������ ���� ������� ������ ���� ����� �� ��� ����� ����� ���� ������ ������ ���� 
--------------------------------------##--------------------------------------##--------------------------------------##
--------------------------------------##--------------------------------------##--------------------------------------##


--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--
--XxXxXxXxXxX-- ������ ����� �������- ����� ������  --XxXxXxXxXxX--

	l = table.copy(line)
	l.text = string.format("{\\pos(%d,%d)\\an5\\fad(100,0)}%s", line.left+syl.center, line.middle, syl.text )
	l.start_time=line.start_time-100 + Universo
	l.end_time=line.start_time+syl.start_time
	l.layer = 1
	subs.append(l)
  
--><><><><><><><><><>--<><><><><><><><><><>
--�� ��� ���� ����� ������� ��� �� ���� ��� ���� ��� ��� ��� ����� (%s) ��� ����� ��� ����� 
-- l.text = string.format  ��� ������� ��� ����� ������� ���� ����� ����
-- ("{��� ������ ������ �������}"
-- syl.text  ������� ��� �� ������� ���� ��� ���� ���������
--><><><><><><><><><>--<><><><><><><><><><>

--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--
--XxXxXxXxXxX-- ������ ������ ������� ( ��� ������ ) ����� ���� ���� �������� ����� --XxXxXxXxXxX--

		local l = table.copy(line)
		l.start_time = line.start_time + syl.start_time --# ��� �� ����� ������� ��� ���� �������
		if syl.duration < 750 then --# ����� �� (���� ������� ������� �� �������� )����� ����� �� ����� ������ ���� ���
		l.end_time = l.start_time + 1500
		else
		l.end_time = l.start_time + syl.duration * 4.5 -- ����� ������� � �� ��� ������ ������ ������ ������ ��� ���� ����� ��� ������ 
		end -- ����� �� ���� ������� ����� �� ������� �� ����� ������� ( �� ���� ������� �� ���� ������ ) �
		l.layer = 2 --# ����� ���� �������
		local tempo = string.format("{\\be1\\move(%d,%d,%%d,%%d)\\an5\\fad(0,150)\\1a&Hd0\\1cHFFFFFF&\\bord0\\shad0\\t(0.5,\\be3\\1a&HFF&)}%s", line.left+syl.center, line.middle, syl.text)
		for j = -10,10 do --#  ����� ��� ��� ����� (������ �������� ���� ������ ������ ��� ��� ���� "���" ������ ������ ������� �� ��� ������ "���" ) �
		l.text = string.format(tempo, line.left+syl.center+math.cos(math.rad(j*6))-15, line.middle+math.sin(math.rad(j*6))*30) --- ���� ���� ����� �� ���� ������ ��� ��� �����
		subs.append(l)                                                                                               -- ����� ���� ������ (20)� ������ (�����) ���� ����� (30) �
		end
-- for j = 0,20 -- ����� ������� ��� ������ ������� ��� �� ������ ����� ����� ������ ��� �����

--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--  
--@@ ��� ������� ������� ���� ������ ������� ���� ������ ��� ����� ������ ���� ����� ������� ���� �������� ����� ���� ���� ����� ���� ���������
--><><><><><><><><><><><><><><><><>---
--math.rad : ����� ������� ��� ���� ��������
--math.cos :  ����� ����� "��� ������ (���)" ��� ���� ��������"� 
--math.cos(math.rad(j*6))-15 // ����
--><><><><><><><><><><><><><><><><>---
--><><><><><><><><><><><><><><><><>---
--math.sin ����� �����"�����" ��� ���� ��������
-- math.sin(math.rad(j*6))*30) // ����
--math.sin --  ������ ������ �� ����� ��� ���� ����� �� ����� ������ ����
--><><><><><><><><><><><><><><><><>---

--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--
--XxXxXxXxXxX-- ������ ������ ������� ( ��� ����� ) ��� ������� ���� ���� �������� --XxXxXxXxXxX--

	l = table.copy(line)
	l.start_time=line.start_time+syl.start_time+20 
	l.end_time=l.end_time+20 + Universo
	l.text =string.format("{\\pos(%d,%d)\\1a&HFF&\\an5\\bord1\\fad(0,100)\\3c&HFFFFFF&}%s", line.left+syl.center, line.middle, syl.text_stripped)
	l.layer=3 -- ����� ���� �������
	subs.append(l) -- ����� ����� ��� �����"�������" ��� ��� ����� ���������      

--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--            
--XxXxXxXxXxX-- ����� ������ ������ ������� ( ��� �������) ��� ����� ������ � �� �������� ���� ������ ��� --XxXxXxXxXxX--
--##<><><><><><><><><><><><>##<><><><><><><><><><>##<><><><><><><><><><>##--

--# �� ������� ��� ����� ����� " ��� " ����� , ������ ���� ���� �� ���� �� �������� ��� ����� ���� ��������� ��� ����� �������� � ���� ����� ������� ���� ������
      end
end

aegisub.register_filter("Future Windy Blur", "~ALKOON~", 2000, new_windy_blur)
--# aegisub.register_filter("name" ," description", priority, function) --# ������ ��� ����� ����� #--
--===================================

--# ��� ����� ���� .. ��������� �����

--#http://jnazh-karaoke.ahlamontada.net/forum.htm
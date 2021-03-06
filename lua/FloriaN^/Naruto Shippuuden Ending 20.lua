include("karaskel.lua")

script_name = "Naruto Ending 20"
script_description = "BLEACH Fillers end 2013"
script_author = "FloriaN"
script_version = ""

xres, yres = aegisub.video_size()		--get video resolution 
if xres == nil  then 
	ratio = 1 
	x_rat = 1
	y_rat = 1
else 
	ratio = yres/576
	x_rat = xres/1024 
	y_rat = x_rat
end
msa = aegisub.ms_from_frame(1)		--get frame duration 
msb = aegisub.ms_from_frame(100) 
if msa == nil and msb == nil then 
	frame_dur = 33  
else 
	frame_dur = (msb-msa)/100 
end

function naru(subs)
	local meta, styles = karaskel.collect_head(subs)
	local i, ai, maxi, maxai = 1, 1, #subs, #subs
	while i <= maxi do
		aegisub.progress.task(string.format("Applying effect (%d/%d)...", ai, maxai))
		aegisub.progress.set((ai-1)/maxai*100)
		local l = subs[i]
		if l.class == "dialogue" and l.style ~= "English" and
				not l.comment then
			karaskel.preproc_line(subs, meta, styles, l)
			do_fx(subs, meta, l)
			maxi = maxi - 1
			subs.delete(i)
		else
			i = i + 1
		end
		ai = ai + 1
	end
	aegisub.progress.task("Finished!")
	aegisub.progress.set(100)
end

function do_fx(subs, meta, line)
math.randomseed(3500);
chari = 0

   for i = 1, line.kara.n do
   
		local syl = line.kara[i]
		local x = line.left + syl.center
		if (line.effect=="low") then
		y = line.middle+40
		else
		y = line.middle
		end
		local shape = "m 0 0 l 0 3 l 3 3 b 4 2 4 1 3 0 l 3 0 b 2 -1 1 -1 0 0 l 0 0 b -1 1 -1 2 0 3 b 1 4 2 4 3 3"	
		local l=table.copy(line)
		
		if syl.i%2==0 then rotate=-10 else rotate=10 end
		
	pox = 0
	
	for char in unicode.chars(syl.text_stripped) do
		cx,cy = aegisub.text_extents(line.styleref,char)
		local charx = line.left + syl.left + (cx/2) + pox
		local chary = y
		pox = pox + cx
		chari = 1+chari
		
		--start2syl
		l.text = string.format("{\\org(%d,%d)\\blur2\\be1\\an5\\pos(%d,%d)\\fscy200\\fscx120\\t(0,%d,\\fscy100\\fscx100)\\fad(200,0)}%s",charx+60,chary,charx,chary,syl.left,char)
		l.start_time = line.start_time-350+(chari-1)*30
		l.end_time = line.start_time + syl.start_time
		l.layer=3
		subs.append(l)
		
		--glitter*_*
		for i=0,3 do
			l.start_time = line.start_time+syl.start_time+math.random(0,syl.duration)-100
			l.end_time = line.start_time+syl.end_time+syl.duration+math.random(-syl.duration,syl.duration)
			l_duration = l.end_time-l.start_time
			l.text = string.format("{\\an5\\move(%d,%d,%d,%d)\\fad(150,150)\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\bord3\\%s\\p%d}%s",charx,chary,charx-math.random(-30,30),chary-math.random(-30,30),glitter(l_duration),math.random(1,3),shape)
			subs.append(l)
		end

		--postline
		l.text = string.format("{\\an5\\move(%d,%d,%d,%d)\\fad(0,150)\\t(\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\bord3\\frz%d\\frx%d\\fry%d)}%s",charx,chary,charx-math.random(-100,100),chary-math.random(-15,15),math.random(-360,360),math.random(-360,360),math.random(-360,360),char)
		l.start_time = line.end_time
		l.end_time = line.end_time + 250
		l.layer = 2
		subs.append(l)
	end
	
	
	--Syl
   	l.text=string.format("{\\an5\\pos(%d,%d)\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\bord3\\fscx200\\fscy200\\frz%d\\t(\\frz0\\3c&H000000&\\bord0\\blur0\\fscx100\\fscy100)}%s",x,y,rotate,syl.text_stripped)
	l.start_time=line.start_time+syl.start_time
	l.end_time=line.start_time+syl.end_time
	l.layer=4
	subs.append(l)
	
	--Syl2end
   	l.text=string.format("{\\an5\\pos(%d,%d)\\blur2\\be1}%s",x,y,syl.text_stripped)
	l.start_time=line.start_time+syl.end_time
	l.end_time=line.end_time
	l.layer=2
	subs.append(l)
	
		
	end
end

function glitter(dur) 
	local tag = "" 
	local time = 0 
	while  (dur > time) do 
		local time1 = time + math.random(dur / 2)
		local time2 = time1 + 1
		local time3 = time2 + frame_dur
		local time4 = time3 + 100
		local size1 = math.random(2,25)*ratio
		local size2 = math.random(1,13)*ratio
		tag = string.format("\\t(%d,%d,\\fscx%d\\fscy%d\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord%f\\blur%f)\\t(%d,%d,\\fscx%d\\fscy%d\\1c&HFFFFFF&\\3c&H000000&\\bord%f\\blur%f)",time1, time2, size1, size1, 2*ratio, 3*ratio, time3, time4, size2, size2,1*ratio, 1*ratio) 
		time = time4
	end 
	return tag 
end

function set_temp(ref,val) temp[ref] = val; return val; end

function macro_MF(subs, sel)
	aegisub.set_undo_point("before run macro")
	naru(subs, {ismacro=true, sel=sel})
end

aegisub.register_macro("Naruto Ending 20","", macro_MF)
aegisub.register_filter("Naruto Ending 20","",2000,naru)
include("karaskel.lua") -- ESTE SIEMPRE SE DEBE DE AGREGAR !!!
include("zheolib.lua") --AHORA AGREGAMOS LA LIBRERIA :D !!
include("formaslib.lua") -- AGREGAMOS EL FORMASLIB !!

-------------------------------CONFIGURACIONES DE LA MACRO--------------------------------

script_name = "Primer y Gran FX !"
script_description = "FX para el pv de LSP - Distance"
script_author = "kichanXcrazy"
script_version = "2.0"

-- ## FUNCI?N GENERADOR FX... NO TOCAR!!!
function fx_zheo(subs)
	aegisub.progress.task("ESPERA MIESTRAS SE HACE EL FX... (Sale a dar una vuelta D:)")
	local meta, styles = karaskel.collect_head(subs)	
	aegisub.progress.task("Aplicando tu FX D:")
	local i, ai, maxi, maxai = 1, 1, #subs, #subs
	while i <= maxi do
		aegisub.progress.task(string.format("Esto llevo trabajado (%d/%d)...", ai, maxai))
		aegisub.progress.set((ai-1)/maxai*100)
		local l = subs[i]
		if l.class == "dialogue" and
				not l.comment and
				(l.style == "1") then --Ac? se puede cambiar por el nombre del Estilo que quieras
				karaskel.preproc_line(subs, meta, styles, l)
			do_fx(subs, meta, l)
			maxi = maxi - 1
			subs.delete(i)
		else
			i = i + 1
		end
		ai = ai + 1
	end
	aegisub.progress.task("Por fin termine D:!")
	aegisub.progress.set(100)
	aegisub.set_undo_point("fx_kXc")
end
-- ## TERMINA FUNCION GENERADOR

-------------------------------TERMINA CONFIGURACIONES DE LA MACRO------------------------
-------------------------------AC? COMIENZA LA CONFIGURACI?N B?SICA-----------------------
-- ## CONFIGURACION DE X-Y
function do_fx(subs, meta, line)
for i = 1, line.kara.n do
local syl = line.kara[i]
local x=syl.center + line.left
local y=line.margin_v + 25
if i == 1 then
tempo=0
end

function sil()
silaba = ""..syl.text_stripped..""
return silaba
end

-------------------------------TERMINA LA CONFIGURACI?N B?SICA-----------------------------
-------------------------------AC? COMIENZAN LOS EFECTOS-----------------------------------

--FX INICIAL
l = table.copy(line)
l.text = "{"..fad(100,0)..an(5)..pos(x,y)..bord(0)..frx(100)..color(1,'ffffff')..t(frx(360)..estilo(1,line.styleref.color1)..bord(1)).."}"..sil()
l.start_time = line.start_time -800
l.end_time = line.start_time
l.layer=0
subs.append(l)

--SILABAS ESTATICAS
--silaba estatica 1 - desenfoque
l = table.copy(line)
l.text = "{"..an(5)..pos(x,y)..bord(3)..blur(6)..estilo(1,line.styleref.color2).."}"..sil()
l.start_time = line.start_time
l.end_time = line.start_time+syl.start_time
l.layer=0
subs.append(l)

--Silaba estatica 2 - borde negro
l = table.copy(line)
l.text = "{"..an(5)..pos(x,y)..bord(1)..color(3,"000000")..estilo(1,line.styleref.color2).."}"..sil()
l.start_time = line.start_time
l.end_time = line.start_time+syl.start_time
l.layer=1
subs.append(l)

--FX DE SILABAS
--SILABA QUE SE DESPRENDE
l = table.copy(line)
l.text = "{"..an(5)..color(1,"53F0FF")..move(x,y,x+rand(80),y+rand(30))..t(fscxy(150)..alpha('ff'))..blur(5).."}"..sil()
l.start_time=line.start_time+syl.start_time
l.end_time=l.start_time+syl.duration
l.layer = 2
subs.append(l)

--ESTRELLAS

l = table.copy(line)
for j = 1,10 do --serian 10 estrellas
	l.text = "{"..an(5)..color(1,RandomColor())..move(x+rand(30),y+rand(30),x-rand(80),y+rand(30))..fscxy(10)..t(fscxy(50)..alpha('ff'))..blur(5).."}"..p(2,Formas(5,5))
	l.start_time=line.start_time+syl.start_time
	l.end_time=l.start_time+syl.duration
	l.layer = 2
	subs.append(l)
end
end
end


-------------------------------AC? TERMINAN LOS EFECTOS------------------------------------
-------------------------------REGISTRO DE LA MACRO Y REGISTRO DE EXPORTACI?N--------------
aegisub.register_macro("Distance!", "Aplica tu FX! D:", fx_kXc)
aegisub.register_filter("Distance!", "Aplica tu FX! D:", 2000, fx_kXc)
-------------------------------TERMINO DE REGISTRO DE LA MACRO Y REGISTRO DE EXPORTACI?N---
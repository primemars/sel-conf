#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_class Chrome_WidgetWin_0 
{
	#g::send www.google.com
	#r::send https://reader.google.com
	#b::send https://cig-bugzilla.isus.emc.com/
	#s::send https://tvg01.lss.emc.com/svn/
	#v::send http://cigreview.lss.emc.com/dashboard/
	#x::send http://www.xiami.com/u/1200086
	#p::send season.cloudfoundry.com/proxy/url_with?url=http://
	#m::send shawn.x.z@gmail.com
	#q::send http://vip.stock.finance.sina.com.cn/q/view/vCffex_Positions_cjcc.php
}


#IfWinActive ahk_class MozillaWindowClass
{
	#g::send www.google.com
	#r::send https://reader.google.com
	#b::send https://cig-bugzilla.isus.emc.com/
	#s::send https://tvg01.lss.emc.com/svn/
	#v::send http://cigreview.lss.emc.com/dashboard/
	#x::send http://www.xiami.com/u/1200086
	#p::send season.cloudfoundry.com/proxy/url_with?url=http://
	#m::send shawn.x.z@gmail.com
	#q::send http://vip.stock.finance.sina.com.cn/q/view/vCffex_Positions_cjcc.php
}
 
; IE
#IfWinActive ahk_class IEFrame 
{
	#p::Send password
}

; Putty
#IfWinActive ahk_class PuTTY 
{
	#p::Send ChangeMe
}
; Evernote
#IfWinActive ahk_class ENMainFrame 
{
	#a::send tag:actionday
	#o::send tag:office
	#n::send tag:next
	#t::send tag:
}



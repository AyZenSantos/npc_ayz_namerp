include('shared.lua')

function nom () 
local rpname = vgui.Create( "DFrame" )
rpname:SetPos( ScrW()/2-150, ScrH()/2-150 )
rpname:SetSize( 400, 250 )
rpname:Center()
rpname:SetTitle("")
rpname:ShowCloseButton( false )
rpname:SetDraggable(true)
rpname:SetVisible( true )
rpname:MakePopup()
rpname.Paint = function()
	 draw.RoundedBox( 5, 0, 0, rpname:GetWide(), rpname:GetTall(), Color( 48,48, 48, 255) )
	 draw.SimpleText("Changer d'identité", "Trebuchet24", 100, 10,Color(255,255,255,255),TEXT_ALIGN_LEFT)
	  draw.RoundedBox( 4, 96, 146, 208, 58, Color( 0, 0, 0, 255 ) )
	draw.RoundedBox( 4, 100, 150, 200, 50, Color( 200, 0, 0, 255 ) )
 
 end
local CloseButton = vgui.Create("DButton", rpname)
CloseButton:SetSize(rpname:GetWide() / 10, rpname:GetTall() / 6- 5) 
CloseButton:AlignRight(8)
CloseButton:AlignTop(8)
CloseButton:SetText("")
CloseButton.DoClick = function()

rpname:Close()

end
CloseButton.Paint = function(self)

draw.RoundedBox(4,0,0,CloseButton:GetWide(),CloseButton:GetTall(),Color(255,0,0,255))

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11,Color(255,255,255,255),TEXT_ALIGN_LEFT) 

if CloseButton:IsHovered() then

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11-2,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
end

end
local TextEntryNom = vgui.Create( "DTextEntry", rpname )
TextEntryNom:SetParent( rpname )
TextEntryNom:SetPos( 125, 100 )
TextEntryNom:SetSize( 125, 25 )
TextEntryNom:SetText("Nom     Prénom")
TextEntryNom.OnEnter = function( self )
text = self:GetValue()
RunConsoleCommand("say","/rpname ".." ".. Text )
end
ButtonNOMRP = vgui.Create("DButton",rpname)
ButtonNOMRP:SetText("Changer de NomRP")
ButtonNOMRP:SetParent( rpname )  
ButtonNOMRP:SetPos(100,150)
ButtonNOMRP:SetTextColor( Color( 0, 0, 0, 250 ) )
ButtonNOMRP:SetFont("Trebuchet24")
ButtonNOMRP:SetSize(200,50)
ButtonNOMRP.Paint = function( self, w, h )
    draw.RoundedBox( 4, 0, 0, w, h, Color( 200, 0, 0, 255 ) )
end
ButtonNOMRP.DoClick = function()
rpname:Close()
RunConsoleCommand("say","/rpname ".." ".. Text )
end
end

usermessage.Hook("nom", nom) 

hook.Add("PostDrawOpaqueRenderables", "nom", function() 
	for _, ent in pairs (ents.FindByClass("npc_namerp")) do 
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
			local Ang = ent:GetAngles()

			Ang:RotateAroundAxis( Ang:Forward(), 90)
			Ang:RotateAroundAxis( Ang:Right(), -90)
		
			cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
				draw.SimpleTextOutlined( 'Changer De NomRP', "HUDNumber5", 0, 0, Color( 255, 255, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))			
			cam.End3D2D()
		end
	end
end)

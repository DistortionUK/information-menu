-----------------------------------Proudly Sponsored By Hexanenetworks.com Cheap, quality hosting!-----------------------------------
  -- _____ _____  _____ _______ ____  _____ _______ _____ ____  _   _ _    _ _  __
 -- |  __ \_   _|/ ____|__   __/ __ \|  __ \__   __|_   _/ __ \| \ | | |  | | |/ /
 -- | |  | || | | (___    | | | |  | | |__) | | |    | || |  | |  \| | |  | | ' / 
 -- | |  | || |  \___ \   | | | |  | |  _  /  | |    | || |  | | . ` | |  | |  <  
 -- | |__| || |_ ____) |  | | | |__| | | \ \  | |   _| || |__| | |\  | |__| | . \ 
 -- |_____/_____|_____/   |_|  \____/|_|  \_\ |_|  |_____\____/|_| \_|\____/|_|\_\
                                                                               


hook.Add( "OnPlayerChat", "OpenCrateGui", function( ply, text, team, isdead )
	MyFPS = math.Round(1/RealFrameTime())
	if (string.sub(text, 1, ChatCommandLength) == ChatCommand) && ply == LocalPlayer() then -- added an extra check
		local Frame = vgui.Create( "DFrame" )
		Frame:SetPos( 20, 80 )
		Frame:SetSize( 250, 200 )
		Frame:SetTitle( "            "..MenuTitle )
		Frame:SetVisible( true )
		Frame:SetDraggable( true )
		Frame:ShowCloseButton( false )
		Frame:MakePopup()
		Frame.Paint = function()
		MyFPS = math.Round(1/RealFrameTime(), 1)
		draw.RoundedBox( 5, 0, 0, Frame:GetWide(), Frame:GetTall(), MenuColour )
		draw.RoundedBox( 0, 0, 0, Frame:GetWide(), 25, Color(0,0,0) )
		draw.SimpleText( "FPS: " .. MyFPS, "DermaLarge", 20, 80, Color( 255, 255, 255, 255 ))
		draw.SimpleText( "Ping: " .. ply:Ping(), "DermaLarge", 20, 110, Color( 255, 255, 255, 255 ))
		end
		local CloseDerma = vgui.Create( "DButton", Frame ) 
		CloseDerma:SetText( " X" )					
		CloseDerma:SetPos( 225, 0 )					
		CloseDerma:SetSize( 25, 25 )	
		CloseDerma:SetTextColor( Color(0, 0, 0, 255) )
		CloseDerma.DoClick = function()				
		Frame:SetVisible( false )			
		end
		CloseDerma.Paint = function()
		draw.RoundedBox( 0, 0, 0, CloseDerma:GetWide(), CloseDerma:GetTall(), Color( 255, 0, 0, 255 ) )
		end
		local OpenMyPage = vgui.Create( "DButton", Frame ) 
		OpenMyPage:SetText( "Open Distortions Page" )					
		OpenMyPage:SetPos( 60, 170 )					
		OpenMyPage:SetSize( 120, 25 )	
		OpenMyPage:SetTextColor( Color(0, 0, 0, 255) )
		OpenMyPage.DoClick = function()				
		gui.OpenURL( "http://www.steamcommunity.com/id/distortionuk" )			
		end
		OpenMyPage.Paint = function()
		draw.RoundedBox( 0, 0, 0, OpenMyPage:GetWide(), OpenMyPage:GetTall(), Color( 255, 0, 0, 255 ) )
		end
		local ChangeName = vgui.Create( "DTextEntry", Frame )
		ChangeName:SetPos( 20,50 )
		ChangeName:SetTall( 20 )
		ChangeName:SetText(ply:SteamID())
		ChangeName:SetWide( 150 )
		ChangeName:SetEnterAllowed( true )
		ChangeName.OnEnter = function()
		Frame:SetVisible( false )
		end
		return true -- surpress the message
	end
	
end )
const
	HELP_TEXT = 'I am a helpful text!';
	IRC_TEXT = 'Join us at Quakenet #soldat-united or visit http://webchat.quakenet.org?channels=soldat-united';
	CALL_HELP_TEXT = 'Type !help to show the help again.';

procedure PrintHelp(Player: TActivePlayer);
begin
	Player.WriteConsole(HELP_TEXT, $ff7f00);
	Player.WriteConsole(IRC_TEXT, $ff7f00);
	Player.WriteConsole(CALL_HELP_TEXT, $ff7f00);
end;

procedure OnJoin(Player: TActivePlayer; Team: TTeam);
begin
	PrintHelp(Player);
end;


procedure OnSpeak(Player: TActivePlayer; Text: String);
begin
	if (Text = '!help') then begin
		PrintHelp(Player);
	end;
end;

procedure Init();
var
	I: Integer;
begin
	for I := 1 to 32 do begin
		Players.Player[I].OnSpeak := @OnSpeak;
	end;
		
	Game.OnJoin := @OnJoin;
end;

begin
	Init;
end.

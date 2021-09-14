package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG.keys;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

#if windows
import Discord.DiscordClient;
#end

class CreditsSubState extends MusicBeatState
{
	
	var bg:FlxSprite;
	var themen:FlxSprite;
	var specialThanks:FlxSprite;
	var lol:FlxSprite;

	var menuItems:FlxTypedGroup<FlxSprite>;

	override function create()
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic(Paths.image('creds/caca', 'shared'));
        bg.screenCenter();
        add(bg);

        specialThanks = new FlxSprite(0, 0);
		add(specialThanks);
		specialThanks.loadGraphic(Paths.image('creds/penis', 'shared'));
        specialThanks.screenCenter();
		specialThanks.visible = false;

        trace("lolololol");

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.SPACE)
		{
			bg.visible = false;
			specialThanks.visible = true;
		} else {
			bg.visible = true;
			specialThanks.visible = false;
		}
		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new MainMenuState());
		}
	}
}
package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.gamepad.FlxGamepad;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class TrashedSubState extends MusicBeatSubstate
{

	public function new(x:Float, y:Float)
	{
		super();

        FlxG.sound.play(Paths.sound('fnf_loss_sfx'));
		Conductor.changeBPM(100);
	}

	override function create()
	{
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bg', 'gb'));
		bg.antialiasing = true;

		bg.setGraphicSize(Std.int(bg.width * 1));
		bg.updateHitbox();
		add(bg);
    }
    private var fading:Bool = false;

	override function update(elapsed:Float)
	{
		var pressed:Bool = FlxG.keys.justPressed.ANY;

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.ANY)
				pressed = true;
		}

		pressed = false;

		if (pressed && !fading)
		{
			fading = true;
			FlxG.sound.music.fadeOut(0.5, 0, function(twn:FlxTween)
			{
				FlxG.sound.music.stop();
				LoadingState.loadAndSwitchState(new PlayState());
			});
		}
		super.update(elapsed);
	}
}


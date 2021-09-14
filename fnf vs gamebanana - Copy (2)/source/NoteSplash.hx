/*package;

import flixel.FlxSprite;

class NoteSplash extends FlxSprite
{
    public function new(X:Float, Y:Float, direction:Int)
    {
        super(X,Y);
        frames = Paths.getSparrowAtlas('noteSplashes', 'shared');
        animation.addByPrefix('idle', 'note splash red 1', 36, false);
        scale.set(1.08, 1.08);
        antialiasing = true;
        alpha = 0.69;

        updateHitbox();
        if(direction == 0 || direction == 3)
            offset.set(0.291 * this.width, 0.315 * this.height);
        else
            offset.set(0.33 * this.width, 0.315 * this.height);
        animation.play('idle');

        animation.finishCallback = function(t){
			kill();
		}
    }
}
*/
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class NoteSplash extends FlxSprite
{
	public var colorSwap:CreditsToShadowMario = null;
	private var idleAnim:String;
	public function new(x:Float = 0, y:Float = 0, ?note:Int = 0) {
		super(x, y);

		frames = Paths.getSparrowAtlas('noteSplashes', 'preload');
		for (i in 1...3) {
			animation.addByPrefix("note1-" + i, "note splash blue " + i, 24, false);
			animation.addByPrefix("note2-" + i, "note splash green " + i, 24, false);
			animation.addByPrefix("note0-" + i, "note splash purple " + i, 24, false);
			animation.addByPrefix("note3-" + i, "note splash red " + i, 24, false);
		}
		setupNoteSplash(x, y, note);
	}

	public function setupNoteSplash(x:Float, y:Float, ?note:Int = 0) {
		setPosition(x - Note.swagWidth * 0.95, y - Note.swagWidth);
		alpha = 0.6;
		var animNum:Int = FlxG.random.int(1, 2);
		if(animNum == 2) {
			offset.set(20, 20);
		} else {
			offset.set(10, 10);
		}

		animation.play('note' + note + '-' + animNum, true);
		animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);
		updateHitbox();
		if(colorSwap == null) {
			colorSwap = new CreditsToShadowMario();
			shader = colorSwap.shader;
		}
	}

	override function update(elapsed:Float) {
		if(animation.curAnim.finished) kill();

		super.update(elapsed);
	}
}
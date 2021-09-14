package;

import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class MainMenuIdle extends FlxSprite
{
    public var animCumsets:Map<String, Array<Dynamic>>;
	public var leDebugMode:Bool = false;

	public var curMan:String = 'gb';

	public var timershite:Float = 0;

    public function new(x:Float, y:Float)
        {
            super(x, y);

            animCumsets = new Map<String, Array<Dynamic>>();


            var tex:FlxAtlasFrames;
            antialiasing = true;

            tex = Paths.getSparrowAtlas('characters/GB', 'shared');
			frames = tex;
			animation.addByPrefix('funny', 'idle banana', 24, true);


            addOffset('funny', -5);
        }

        public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
            {
                animation.play(AnimName, Force, Reversed, Frame);
        
                var daOffset = animCumsets.get(AnimName);
                if (animCumsets.exists(AnimName))
                {
                    offset.set(daOffset[0], daOffset[1]);
                }
                else
                    offset.set(0, 0);
        
                
            }

            public function addOffset(name:String, x:Float = 0, y:Float = 0)
                {
                    animCumsets[name] = [x, y];
                }
        
        override function update(elapsed:Float)
            {



                super.update(elapsed);
            }
            
}

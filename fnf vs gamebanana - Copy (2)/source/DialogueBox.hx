package;

import openfl.system.System;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var sound:FlxSound;
	var bgImage:FlxSprite;

	public var ending:Bool = false;

	public function new(?dialogueList:Array<String>)
	{
		super();

		//scrollFactor.set();
		
		var hasDialog = true;

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;

		//FlxG.sound.playMusic(Paths.music('', 'shared'), 0);	
		//FlxG.sound.music.fadeIn(1, 0, 0.8);

		bgImage = new FlxSprite().loadGraphic(Paths.image('0', 'shared'));
		bgImage.setGraphicSize(Std.int((FlxG.width)), Std.int((FlxG.height)));
		bgImage.updateHitbox();
		bgImage.screenCenter();
		bgImage.scrollFactor.set();
		bgImage.antialiasing = true;
		add(bgImage);

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = Paths.font('vcr.ttf');
		dropText.color = FlxColor.BLACK;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = Paths.font('vcr.ttf');
		swagDialogue.color = FlxColor.WHITE;
		add(swagDialogue);

		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('EOOUG'), 0.6)];

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		dropText.text = swagDialogue.text;


		dialogueOpened = true;

		if (dialogueOpened && !dialogueStarted)
		{
			startDaEUUUGHG();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			remove(dialogue);
				
			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					FlxG.sound.music.stop();

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDaEUUUGHG();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDaEUUUGHG():Void
	{
		eOUGHGH();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);
	}

	function eOUGHGH():Void
		{
			var splitName:Array<String> = dialogueList[0].split(":");
			trace(splitName[0]);
			trace(splitName[1]);
	
			var prefix:String = '';
	
			bgImage.loadGraphic(Paths.image((prefix + splitName[1]), 'shared'));
			dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
		}
	}
	
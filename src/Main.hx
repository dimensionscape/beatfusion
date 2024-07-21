package;

import bf.core.Engine;
import starling.events.Event;
import game.animations.gf.BaseDanceLeft;
import game.animations.gf.BaseDanceRight;
import bf.graphics.AnimatedSprite;
import bf.asset.Spritesheets;
import bf.input.keyboard.KeyboardManager;
import bf.view.NoteView;
import bf.asset.AssetManager;
import starling.display.Sprite;
import bf.ui.Note;

/**
 * ...
 * @author Christopher Speciale
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();		
		
		var noteView:NoteView = new NoteView();
		noteView.x = 580;
		noteView.y = 16;
		addChild(noteView);
		
		var gfRight:BaseDanceRight = new BaseDanceRight();
		var gfLeft:BaseDanceLeft = new BaseDanceLeft();

		var gf:AnimatedSprite<String> = new AnimatedSprite();
		gf.set("danceRight", gfRight);
		gf.set("danceLeft", gfLeft);
		addChild(gf);

		gf.setCurrent("danceRight");	
		gf.play();
		
		var left:Bool = true;
		gf.addEventListener(Event.COMPLETE, (e:Event)->{
			if(left){
				gf.play("danceRight");
			} else {
				gf.play("danceLeft");
			}
			left = !left;
		});

		KeyboardManager.setKeyDownCallback(LEFT, ()->{
			noteView.leftNote.isActive = true;
			Engine.engine.camera.easeX(-130);
		});

		KeyboardManager.setKeyUpCallback(LEFT, ()->{
			noteView.leftNote.isActive = false;
			
		});

		KeyboardManager.setKeyDownCallback(RIGHT, ()->{
			noteView.rightNote.isActive = true;
			Engine.engine.camera.easeX(130);
		});

		KeyboardManager.setKeyUpCallback(RIGHT, ()->{
			noteView.rightNote.isActive = false;
		});

		KeyboardManager.setKeyDownCallback(UP, ()->{
			noteView.upNote.isActive = true;
			Engine.engine.camera.easeY(-130);
		});

		KeyboardManager.setKeyUpCallback(UP, ()->{
			noteView.upNote.isActive = false;
		});

		KeyboardManager.setKeyDownCallback(DOWN, ()->{
			noteView.downNote.isActive = true;
			Engine.engine.camera.easeY(130);
		});

		KeyboardManager.setKeyUpCallback(DOWN, ()->{
			noteView.downNote.isActive = false;
		});

	}

}

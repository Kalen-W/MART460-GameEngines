package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_1 extends SceneScript
{
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				for(actorOfType in getActorsOfType(getActorType(1)))
				{
					if(actorOfType != null && !actorOfType.dead && !actorOfType.recycled){
						if((actorOfType.getX() <= -((actorOfType.getWidth()))))
						{
							actorOfType.setX((getSceneWidth() - 1));
						}
						else if((actorOfType.getX() >= getSceneWidth()))
						{
							actorOfType.setX((1 - (actorOfType.getWidth())));
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(6));
				g.drawString("" + (Engine.engine.getGameAttribute("score") : Float), 2, 2);
				if(((Engine.engine.getGameAttribute("winState") : String) == "lose"))
				{
					g.drawString("" + "Game Over", ((getSceneWidth() / 2) - (g.font.getTextWidth("Game Over")/Engine.SCALE / 2)), ((getSceneHeight() / 2) - (g.font.getHeight()/Engine.SCALE / 2)));
					engine.pause();
				}
				else if(((Engine.engine.getGameAttribute("winState") : String) == "win"))
				{
					g.drawString("" + "You Won!", ((getSceneWidth() / 2) - (g.font.getTextWidth("You Won!")/Engine.SCALE / 2)), ((getSceneHeight() / 2) - (g.font.getHeight()/Engine.SCALE / 2)));
					engine.pause();
				}
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("enter", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				if((engine.isPaused() && (((Engine.engine.getGameAttribute("winState") : String) == "lose") || ((Engine.engine.getGameAttribute("winState") : String) == "win"))))
				{
					reloadCurrentScene(createPixelizeOut(2, Utils.getColorRGB(0,0,0)), createPixelizeIn(2, Utils.getColorRGB(0,0,0)));
					Engine.engine.setGameAttribute("winState", "null");
					Engine.engine.setGameAttribute("score", 0);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}
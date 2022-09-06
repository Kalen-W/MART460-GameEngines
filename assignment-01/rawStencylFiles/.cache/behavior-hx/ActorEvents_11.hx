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



class ActorEvents_11 extends ActorScript
{
	public var _moveDirection:Float;
	public var _occupiedCellx:Float;
	public var _occupiedCelly:Float;
	public var _moveSpeed:Float;
	public var _availableDirections:Array<Dynamic>;
	public var _randDirList:Array<Dynamic>;
	public var _randDir:Float;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_setMoveSpeed():Void
	{
		if((_moveDirection == 0))
		{
			actor.setXVelocity(0);
			actor.setYVelocity(-(_moveSpeed));
		}
		else if((_moveDirection == 1))
		{
			actor.setXVelocity(_moveSpeed);
			actor.setYVelocity(0);
		}
		else if((_moveDirection == 2))
		{
			actor.setXVelocity(0);
			actor.setYVelocity(_moveSpeed);
		}
		else if((_moveDirection == 3))
		{
			actor.setXVelocity(-(_moveSpeed));
			actor.setYVelocity(0);
		}
	}
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("moveDirection", "_moveDirection");
		_moveDirection = 0.0;
		nameMap.set("occupiedCell_x", "_occupiedCellx");
		_occupiedCellx = 0.0;
		nameMap.set("occupiedCell_y", "_occupiedCelly");
		_occupiedCelly = 0.0;
		nameMap.set("moveSpeed", "_moveSpeed");
		_moveSpeed = 0.0;
		nameMap.set("availableDirections", "_availableDirections");
		nameMap.set("randDirList", "_randDirList");
		nameMap.set("randDir", "_randDir");
		_randDir = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_moveDirection = 0;
		_moveSpeed = 6;
		actor.shout("_customEvent_" + "setMoveSpeed");
		
		/* ======================= Member of Group ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorGroup(1),event.otherActor.getType(),event.otherActor.getGroup()))
			{
				_occupiedCellx = Math.floor((actor.getX() / getTileWidth()));
				_occupiedCelly = Math.floor((actor.getY() / getTileHeight()));
				if(((_moveDirection == 0) && tileExistsAt(Std.int((_occupiedCelly - 1)), Std.int(_occupiedCellx), engine.getLayerById(Std.int((Engine.engine.getGameAttribute("tileLayerId") : Float))))))
				{
					_randDir = randomInt(0, 3);
					if((_randDir == 0))
					{
						_moveDirection = 1;
					}
					else if((_randDir == 1))
					{
						_moveDirection = 2;
					}
					else if((_randDir == 2))
					{
						_moveDirection = 3;
					}
				}
				else if(((_moveDirection == 1) && tileExistsAt(Std.int(_occupiedCelly), Std.int((_occupiedCellx + 1)), engine.getLayerById(Std.int((Engine.engine.getGameAttribute("tileLayerId") : Float))))))
				{
					_randDir = randomInt(0, 3);
					if((_randDir == 0))
					{
						_moveDirection = 2;
					}
					else if((_randDir == 1))
					{
						_moveDirection = 3;
					}
					else if((_randDir == 2))
					{
						_moveDirection = 0;
					}
				}
				else if(((_moveDirection == 2) && tileExistsAt(Std.int((_occupiedCelly + 1)), Std.int(_occupiedCellx), engine.getLayerById(Std.int((Engine.engine.getGameAttribute("tileLayerId") : Float))))))
				{
					_randDir = randomInt(0, 3);
					if((_randDir == 0))
					{
						_moveDirection = 3;
					}
					else if((_randDir == 1))
					{
						_moveDirection = 0;
					}
					else if((_randDir == 2))
					{
						_moveDirection = 1;
					}
				}
				else if(((_moveDirection == 3) && tileExistsAt(Std.int(_occupiedCelly), Std.int((_occupiedCellx - 1)), engine.getLayerById(Std.int((Engine.engine.getGameAttribute("tileLayerId") : Float))))))
				{
					_randDir = randomInt(0, 3);
					if((_randDir == 0))
					{
						_moveDirection = 0;
					}
					else if((_randDir == 1))
					{
						_moveDirection = 1;
					}
					else if((_randDir == 2))
					{
						_moveDirection = 2;
					}
				}
				actor.shout("_customEvent_" + "setMoveSpeed");
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}
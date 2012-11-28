package me.xplabs.common 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import me.xplabs.constant.MapConst;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.interfaces.IViewStandard;
	import mx.core.UIComponent;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MouseStyleView extends Sprite implements IViewStandard
	{
		private var _mouseBitamp:Bitmap;
		private var _resName:String;
		[Inject]
		public var resLibrary:IResLibrary;
		private var _rect:Rectangle;
		public function MouseStyleView() 
		{
			this.mouseChildren = false;
			this.mouseEnabled = false;
			//this.scrollRect = new Rectangle(0, 20, MapConst.stageW - 200, MapConst.stageH);
			//this.scrollRect = new Rectangle(0, 20, 300, 300);
		}
		public function  init():void
		{
			_mouseBitamp = new Bitmap();
			addChild(_mouseBitamp);
			addEventListener(Event.ADDED_TO_STAGE, onAddStage);
		}
		
		private function onAddStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddStage);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
		}
		
		private function mouseMoveHandler(e:MouseEvent):void 
		{
			if (_mouseBitamp.bitmapData)
			{
				_mouseBitamp.x = this.mouseX + _mouseBitamp.bitmapData["x"];
				_mouseBitamp.y = this.mouseY + _mouseBitamp.bitmapData["y"];
			}
		}
		
		public function changeStype(pkey:String):void
		{
			_resName = pkey;
			_mouseBitamp.bitmapData = resLibrary.getResObj(_resName);
			_mouseBitamp.x = stage.mouseX + _mouseBitamp.bitmapData["x"];
			_mouseBitamp.y = stage.mouseY + _mouseBitamp.bitmapData["y"];
		}
		
		public function dispose():void
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddStage);
		}
		
		public function defaultStyle():void
		{
			_mouseBitamp.bitmapData = null;
		}
		
		/* INTERFACE me.xplabs.interfaces.IViewStandard */
		
		public function setWH(pw:int, ph:int):void 
		{
			if (!_rect) _rect = new Rectangle();
			_rect.width = pw - 215;
			_rect.height = ph - 95;
			this.scrollRect = _rect;
			//this.scrollRect = new Rectangle(0, 0, pw - 215, ph - 95);
		}
		
		public function setXY(px:int, py:int):void 
		{
			
		}
	}

}
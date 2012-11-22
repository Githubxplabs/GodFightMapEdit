package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import me.xplabs.constant.MapConst;
	import me.xplabs.interfaces.IViewStandard;
	import mx.controls.Image;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	/**
	 * 背景层
	 * ...
	 * @author xiaohan
	 */
	public class BackGroundLayer extends Container implements IViewStandard
	{
		private var _bitmapData:BitmapData;
		private var _rect:Rectangle;
		private var _image:Image;
		public function BackGroundLayer() 
		{
			super();
			_rect = new Rectangle();
			_image = new Image();
			//addChild(_image);
			addElement(_image);
		}
		
		/* INTERFACE me.xplabs.interfaces.IViewStandard */
		
		public function setWH(pw:int, ph:int):void 
		{
			_rect.width = pw;
			_rect.width = ph;
		}
		
		public function setXY(px:int, py:int):void 
		{
			_rect.x = px;
			_rect.y = py;
		}
		private function updateBitmapData():void
		{
			if (!_bitmapData) return;
			//_image.source.copyPixels(_bitmapData, _rect, new Point());
			_image.source = _bitmapData;
		}
		public function get bitmapData():BitmapData 
		{
			return _bitmapData;
		}
		
		public function set bitmapData(value:BitmapData):void 
		{
			_bitmapData = value;
			updateBitmapData();
		}
		
		
		
		override public function get x():Number 
		{
			return super.x;
		}
		
		override public function set x(value:Number):void 
		{
			//super.x = value;
		}
		
		override public function get y():Number 
		{
			return super.y;
		}
		
		override public function set y(value:Number):void 
		{
			//super.y = value;
		}
		
	}

}
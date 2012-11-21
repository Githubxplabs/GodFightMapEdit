package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import me.xplabs.constant.MapConst;
	import me.xplabs.interfaces.IViewStandard;
	
	/**
	 * 背景层
	 * ...
	 * @author xiaohan
	 */
	public class BackGroundLayer extends Bitmap implements IViewStandard
	{
		private var _bitmapData:BitmapData;
		private var _rect:Rectangle;
		public function BackGroundLayer() 
		{
			super();
			_rect = new Rectangle();
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
			bitmapData.copyPixels(_bitmapData, _rect);
		}
		override public function get bitmapData():BitmapData 
		{
			return super.bitmapData;
		}
		
		override public function set bitmapData(value:BitmapData):void 
		{
			_bitmapData = new BitmapData();
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
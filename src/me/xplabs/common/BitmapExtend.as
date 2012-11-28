package me.xplabs.common
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class BitmapExtend extends BitmapData
	{
		public var x:int;
		public var y:int;
		public var cells:Vector.<Point>;
		
		public function BitmapExtend(pw:int = 800, ph:int = 667)
		{
			super(pw, ph);
			cells = new Vector.<Point>();
		}
	}
}
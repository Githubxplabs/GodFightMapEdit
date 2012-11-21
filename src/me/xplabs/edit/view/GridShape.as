package me.xplabs.edit.view 
{
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class GridShape extends Shape 
	{
		
		public function GridShape() 
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			graphics.lineStyle(1);
			graphics.moveTo(32, 0);
			graphics.lineTo(0, 16);
			graphics.lineTo(32, 32);
			graphics.lineTo(64, 16);
			graphics.lineTo(32, 0);
			graphics.endFill();
		}
		
	}

}
package me.xplabs.edit.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapResizeEvent extends Event 
	{
		/**
		 * 地图舞台尺寸变化
		 */
		public static const UPDATE_RESIZE:String = "MapResizeEvent.UPDATE_RESIZE";
		/**
		 * 舞台的宽度
		 */
		public var stageW:int;
		/**
		 * 舞台的高度
		 */
		public var stageH:int;
		public function MapResizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}
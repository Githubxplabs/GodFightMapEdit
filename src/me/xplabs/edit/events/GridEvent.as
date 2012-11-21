package me.xplabs.edit.events 
{
	import flash.events.Event;
	
	/**
	 * 自定义事件类
	 * ...
	 * @author xiaohan
	 */
	public class GridEvent extends Event 
	{
		/**
		 * 生成网格
		 */
		public static const CREAT_GRID:String = "GridEvent.CREAT_GRID";
		public var rows:int;
		public var cols:int;
		
		public function GridEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}
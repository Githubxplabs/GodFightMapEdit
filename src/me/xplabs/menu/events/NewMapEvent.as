package me.xplabs.menu.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class NewMapEvent extends Event 
	{
		/**
		 * 确定创建地图
		 */
		public static const ENTER_NEW_MAP:String = "NewMapEvent.ENTER_NEW_MAP";
		/**
		 * 地图宽度
		 */
		public var mapW:int;
		/**
		 * 地图高度
		 */
		public var mapH:int;
		public function NewMapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}
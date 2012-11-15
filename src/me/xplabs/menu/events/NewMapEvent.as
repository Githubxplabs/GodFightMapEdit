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
		public function NewMapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}
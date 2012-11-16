package me.xplabs.edit.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class EditEvent extends Event 
	{
		/**
		 * 关闭正在编辑的地图
		 */
		public static const CLOSE_EDIT_MAP:String = "EditEvent.CLOSE_EDIT_MAP";
		public function EditEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}
package me.xplabs.edit.events 
{
	import flash.events.Event;
	import me.xplabs.interfaces.IImageRes;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ImageEvent extends Event 
	{
		public static const IMAGE_CLICK:String = "ImageEvent";
		public var imageRes:IImageRes;
		public function ImageEvent(type:String, imageRes:IImageRes, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			this.imageRes = imageRes;
		}
		
	}

}
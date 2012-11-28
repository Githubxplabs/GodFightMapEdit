package me.xplabs.edit.view 
{
	import me.xplabs.interfaces.IImageRes;
	import spark.components.Image;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ImageRes extends Image implements IImageRes
	{
		private var _resName:String;
		private var _resId:int;
		public function ImageRes() 
		{
			super();
			
		}
		
		/* INTERFACE me.xplabs.interfaces.IImageRes */
		
		public function get resName():String 
		{
			return _resName;
		}
		
		public function set resName(value:String):void 
		{
			_resName = value;
		}
		
		public function get resId():int 
		{
			return _resId;
		}
		
		public function set resId(value:int):void 
		{
			_resId = value;
		}
		
	}

}
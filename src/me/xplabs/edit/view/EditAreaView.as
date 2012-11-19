package me.xplabs.edit.view 
{
	import mx.containers.Panel;
	import mx.containers.TitleWindow;
	import mx.core.UIComponent;
	
	/**
	 * 编辑视图区域
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaView extends UIComponent
	{
		private var _titleWindow:TitleWindow;
		
		public function EditAreaView() 
		{
			init();
		}
		
		private function init():void 
		{
			_titleWindow = new TitleWindow();
			_titleWindow.width = 800;
			_titleWindow.height = 550;
			_titleWindow.title = "编辑区域";
			addChild(_titleWindow);
		}
		
		public function dispose():void
		{
			
		}
	}

}
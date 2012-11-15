package me.xplabs.edit.view 
{
	import mx.containers.Panel;
	import mx.core.UIComponent;
	
	/**
	 * 编辑视图区域
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaView extends UIComponent
	{
		private var _bgPanel:Panel;
		
		public function EditAreaView() 
		{
			init();
		}
		
		private function init():void 
		{
			_bgPanel = new Panel();
			_bgPanel.width = 600;
			_bgPanel.height = 560;
			addChild(_bgPanel);
		}
		
	}

}
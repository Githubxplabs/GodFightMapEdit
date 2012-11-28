package  
{
	import flash.display.Sprite;
	//import me.xplabs.edit.view.ElementsControlViews;
	import mx.core.UIComponent;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapEdit extends UIComponent 
	{
		private var _godFightServerContext : MapEditContext;
		public function MapEdit() {
			init();
		}

		private function init() : void {
			_godFightServerContext = new MapEditContext(this);
			//addChild(new ElementsControlViews());
		}
	}
}
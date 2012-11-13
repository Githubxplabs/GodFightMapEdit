package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapEdit extends Sprite 
	{
		private var _godFightServerContext : MapEditContext;

		public function MapEdit() {
			init();
		}

		private function init() : void {
			_godFightServerContext = new MapEditContext(this);
		}
	}

}
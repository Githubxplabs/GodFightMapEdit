package me.xplabs.menu.controller 
{
	import me.xplabs.constant.MapConst;
	import me.xplabs.menu.view.NewMapView;
	import me.xplabs.menu.view.NewMapViewMediator;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class NewMapCommand extends Command 
	{
		
		public function NewMapCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			super.execute();
			
			if (!mediatorMap.hasMapping(NewMapView)) mediatorMap.mapView(NewMapView, NewMapViewMediator);
			var newMapView:NewMapView = new NewMapView();
			newMapView.x = MapConst.stageCenterX - newMapView.uiW * .5;
			newMapView.y = MapConst.stageCenterY - newMapView.uiH* .5;
			contextView.addChild(newMapView);
			newMapView = null;
			
		}
		
	}

}
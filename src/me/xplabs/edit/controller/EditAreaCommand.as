package me.xplabs.edit.controller 
{
	import flash.geom.Point;
	import me.xplabs.edit.model.MapIsoWorld;
	import me.xplabs.edit.view.EditAreaMediator;
	import me.xplabs.edit.view.EditAreaView;
	import me.xplabs.menu.events.NewMapEvent;
	import me.xplabs.utils.Utils;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaCommand extends Command 
	{
		[Inject]
		public var event:NewMapEvent;
		public function EditAreaCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
						
			
			
			if (!mediatorMap.hasMapping(EditAreaView)) mediatorMap.mapView(EditAreaView, EditAreaMediator);
			
			
			var mapIsoWorld:MapIsoWorld = new MapIsoWorld();
			injector.mapValue(MapIsoWorld, mapIsoWorld);
			injector.injectInto(mapIsoWorld);
			mapIsoWorld.init(event.mapW, event.mapH);
			
			var editAreaView:EditAreaView = new EditAreaView();
			editAreaView.init(event.mapW, event.mapH);
			contextView.addChild(editAreaView);
		}
		
	}

}
package me.xplabs 
{
	import me.xplabs.edit.controller.EditAreaCommand;
	import me.xplabs.edit.controller.ElementsControlCommand;
	import me.xplabs.edit.view.EditAreaMediator;
	import me.xplabs.edit.view.EditAreaView;
	import me.xplabs.menu.controller.NewMapCommand;
	import me.xplabs.menu.events.MapMenuEvent;
	import me.xplabs.menu.events.NewMapEvent;
	import me.xplabs.menu.view.MenuView;
	import me.xplabs.menu.view.MenuViewMediator;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class StartupCommand extends Command 
	{
		
		public function StartupCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
			
			mediatorMap.mapView(MenuView, MenuViewMediator);
			contextView.addChild(new MenuView());
			
			commandMap.mapEvent(MapMenuEvent.NEW_MAP, NewMapCommand, MapMenuEvent);
			commandMap.mapEvent(NewMapEvent.ENTER_NEW_MAP, EditAreaCommand, NewMapEvent);
			commandMap.mapEvent(NewMapEvent.ENTER_NEW_MAP, ElementsControlCommand, NewMapEvent);
			
		}
		
	}

}
package me.xplabs 
{
	import com.greensock.events.LoaderEvent;
	import me.xplabs.common.MouseStyleView;
	import me.xplabs.edit.controller.EditAreaCommand;
	import me.xplabs.edit.controller.ElementsControlCommand;
	import me.xplabs.edit.controller.GridCommand;
	import me.xplabs.edit.events.GridEvent;
	import me.xplabs.edit.events.ImageEvent;
	import me.xplabs.edit.view.EditAreaMediator;
	import me.xplabs.edit.view.EditAreaView;
	import me.xplabs.interfaces.IFileLoader;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.loader.ResLibrary;
	import me.xplabs.menu.controller.NewMapCommand;
	import me.xplabs.menu.events.MapMenuEvent;
	import me.xplabs.menu.events.NewMapEvent;
	import me.xplabs.menu.view.MenuView;
	import me.xplabs.menu.view.MenuViewMediator;
	import me.xplabs.res.model.FileLoaderRes;
	import me.xplabs.utils.Domain;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class StartupCommand extends Command 
	{
		[Inject]
		public var resLibrary:IResLibrary;
		[Inject]
		public var fileLoaderRes:IFileLoader;
		public function StartupCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
			
			resLibrary.parse(Domain.resConfig, { onComplete:resConfigCompleteHandler } );
			
			
			
			
			
			mediatorMap.mapView(MenuView, MenuViewMediator);
			contextView.addChild(new MenuView());
			
			commandMap.mapEvent(MapMenuEvent.NEW_MAP, NewMapCommand, MapMenuEvent);
			commandMap.mapEvent(NewMapEvent.ENTER_NEW_MAP, EditAreaCommand, NewMapEvent);
			commandMap.mapEvent(NewMapEvent.ENTER_NEW_MAP, ElementsControlCommand, NewMapEvent);
			commandMap.mapEvent(GridEvent.CREAT_GRID, GridCommand, GridEvent);
			//commandMap.mapEvent(ImageEvent.IMAGE_CLICK, MouseStyleCommand, ImageEvent);
			//mediatorMap.mapView(MouseStyleView, MouseStyleMediator);
			
			
			
		}
		
		private function resConfigCompleteHandler(e:LoaderEvent):void 
		{
			var xml:XML = resLibrary.getResObj(Domain.resConfig);
			for each (var item:XML in xml.folder) 
			{
				fileLoaderRes.loadRes(String(item));
			}
			fileLoaderRes.starLoad();
		}
	}
}
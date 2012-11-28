package
{
	import com.greensock.events.LoaderEvent;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import me.xplabs.common.MouseStyleView;
	import me.xplabs.constant.MapConst;
	import me.xplabs.edit.events.MapResizeEvent;
	import me.xplabs.interfaces.IFileLoader;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.interfaces.IResName;
	import me.xplabs.loader.ResLibrary;
	import me.xplabs.res.model.FileLoaderRes;
	import me.xplabs.StartupCommand;
	import me.xplabs.utils.Domain;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapEditContext extends Context
	{
		
		public function MapEditContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		
		}
		
		override public function startup():void
		{
			
			
			//injector.mapSingletonOf(IResLibrary, ResLibrary);
			var resLibrary:ResLibrary = new ResLibrary();
			injector.mapValue(IResLibrary, resLibrary);
			injector.injectInto(resLibrary);
			
			var mouseStyle:MouseStyleView = new MouseStyleView();
			//mouseStyle.resLibrary = resLibrary;
			//contextView.stage.addChild(mouseStyle);
			mouseStyle.init();
			mouseStyle.setWH(MapConst.stageW, MapConst.stageH);
			injector.mapValue(MouseStyleView, mouseStyle);
			injector.injectInto(mouseStyle);
			
			var fileLoaderRes:FileLoaderRes = new FileLoaderRes();
			injector.mapValue(IFileLoader, fileLoaderRes);
			injector.mapValue(IResName, fileLoaderRes);
			injector.injectInto(fileLoaderRes);
			
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent);
			contextView.stage.addEventListener(Event.RESIZE, stageRezise);
			super.startup();
		
		}
		
		private function stageRezise(event:Event):void
		{
			// TODO Auto-generated method stub
			var tempW:int = event.currentTarget.stageWidth;
			var tempH:int = event.currentTarget.stageHeight;
			var e:MapResizeEvent = new MapResizeEvent(MapResizeEvent.UPDATE_RESIZE);
			if (tempW < MapConst.stageW) e.stageW = MapConst.stageW;
			else e.stageW = tempW;
			if (tempH < MapConst.stageH) e.stageH = MapConst.stageH;
			else e.stageH = tempH;
			dispatchEvent(e);
		}
	}

}
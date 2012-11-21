package
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import me.xplabs.constant.MapConst;
	import me.xplabs.edit.events.MapResizeEvent;
	import me.xplabs.StartupCommand;
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
			else e.stageH = tempH;		;
			dispatchEvent(e);
		}
	}

}
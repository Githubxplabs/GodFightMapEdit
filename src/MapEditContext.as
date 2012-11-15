package  
{
	import flash.display.DisplayObjectContainer;
	import me.xplabs.StartupCommand;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapEditContext extends Context 
	{
		
		public function MapEditContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true) 
		{
			super(contextView, autoStartup);
			
		}
		
		override public function startup():void 
		{
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent);
			super.startup();
			
		}
	}

}
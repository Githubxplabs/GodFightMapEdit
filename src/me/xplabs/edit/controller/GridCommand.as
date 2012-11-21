package me.xplabs.edit.controller 
{
	import me.xplabs.edit.events.GridEvent;
	import me.xplabs.edit.view.GridView;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class GridCommand extends Command 
	{
		[Inject]
		public var gridEvent:GridEvent;
		public function GridCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
			
			/*if (injector.hasMapping(GridViewMediator)) return;
			mediatorMap.mapView(GridView, GridViewMediator);
			var gridView:GridView = new GridView();
			gridView.init(gridEvent.rows, gridEvent.cols);
			//gridView.init(200, 200);
			contextView.addChild(gridView);*/
		}
		
	}

}
package me.xplabs.edit.view 
{
	import me.xplabs.edit.events.EditEvent;
	import me.xplabs.edit.events.MapResizeEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaMediator extends Mediator 
	{
		[Inject]
		public var editAreaView:EditAreaView;
		public function EditAreaMediator() 
		{
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			
			editAreaView.x = 0;
			editAreaView.y = 20;
			
			addContextListener(EditEvent.CLOSE_EDIT_MAP, closeMapHandler, EditEvent);
			addContextListener(MapResizeEvent.UPDATE_RESIZE, updateResizeHandler);
		}
		
		private function updateResizeHandler(e:MapResizeEvent):void 
		{
			editAreaView.setWH(e.stageW - 200, e.stageH - 50);
		}
		
		private function closeMapHandler(e:EditEvent):void 
		{
			if (editAreaView.parent) editAreaView.parent.removeChild(editAreaView);
		}
		override public function onRemove():void 
		{
			super.onRemove();
			editAreaView.dispose();
			removeContextListener(EditEvent.CLOSE_EDIT_MAP, closeMapHandler, EditEvent);
			editAreaView = null;
		}
	}

}
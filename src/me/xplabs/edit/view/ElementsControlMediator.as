package me.xplabs.edit.view 
{
	import me.xplabs.edit.events.ImageEvent;
	import me.xplabs.edit.events.MapResizeEvent;
	import me.xplabs.interfaces.IImageRes;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.interfaces.IResName;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ElementsControlMediator extends Mediator 
	{
		[Inject]
		public var elementsConrolView:ElementsControlView;
		[Inject]
		public var resLibrary:IResLibrary;
		[Inject]
		public var resName:IResName;
		public function ElementsControlMediator() 
		{
			super();
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			
			
			elementsConrolView.resLibrary = resLibrary;
			elementsConrolView.resName = resName;
			
			
			elementsConrolView.init();
			elementsConrolView.x = 800;
			elementsConrolView.y = 20;
			elementsConrolView.imageClick = imageClickHandler;
			
			
			addContextListener(MapResizeEvent.UPDATE_RESIZE, updateResizeHandler);
		}
		
		private function imageClickHandler(imageRes:IImageRes):void 
		{
			dispatch(new ImageEvent(ImageEvent.IMAGE_CLICK, imageRes));
		}
		
		private function updateResizeHandler(e:MapResizeEvent):void 
		{
			elementsConrolView.setXY(e.stageW - 200, -1);
			elementsConrolView.setWH(e.stageW, e.stageH);
		}
	}

}
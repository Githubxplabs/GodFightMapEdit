package me.xplabs.edit.view 
{
	import flash.display.BitmapData;
	import flash.events.KeyboardEvent;
	import flash.ui.Mouse;
	import me.xplabs.common.MouseStyleView;
	import me.xplabs.edit.events.EditEvent;
	import me.xplabs.edit.events.ImageEvent;
	import me.xplabs.edit.events.MapResizeEvent;
	import me.xplabs.menu.events.MapMenuEvent;
	import me.xplabs.utils.ASCII;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaMediator extends Mediator 
	{
		[Inject]
		public var editAreaView:EditAreaView;
		[Inject]
		public var mouseStyle:MouseStyleView;
		public function EditAreaMediator() 
		{
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			
			editAreaView.x = 0;
			editAreaView.y = 20;
			
			addContextListener(EditEvent.CLOSE_EDIT_MAP, closeMapHandler, EditEvent);
			addContextListener(MapResizeEvent.UPDATE_RESIZE, updateResizeHandler, MapResizeEvent);
			addContextListener(EditEvent.LOADER_BACKGROUND, loaderBackgroundHandler, EditEvent);
			addContextListener(MapMenuEvent.SHOW_GRID, showGridHandler, MapMenuEvent);
			addContextListener(MapMenuEvent.HIDE_GRID, hideGridHandler, MapMenuEvent);
			
			addContextListener(ImageEvent.IMAGE_CLICK, imageClickHandler, ImageEvent);
			editAreaView.addChild(mouseStyle);
			mouseStyle.y = mouseStyle.y + 31;
			
			contextView.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			if (e.keyCode == ASCII.POINT)
			{
				mouseStyle.defaultStyle();
			}
		}
		
		private function imageClickHandler(e:ImageEvent):void 
		{
			mouseStyle.changeStype(e.imageRes.resName);
		}
		/**
		 * 隐藏网格
		 * @param	e
		 */
		private function hideGridHandler(e:MapMenuEvent):void 
		{
			editAreaView.hideGridHandler();
		}
		/**
		 * 显示网格
		 * @param	e
		 */
		private function showGridHandler(e:MapMenuEvent):void 
		{
			editAreaView.showGridHandler();
		}
		
		private function loaderBackgroundHandler(e:EditEvent):void 
		{
			editAreaView.setBitmapData(BitmapData(e.data));
		}
		
		private function updateResizeHandler(e:MapResizeEvent):void 
		{
			editAreaView.setWH(e.stageW - 200, e.stageH - 50);
			mouseStyle.setWH(e.stageW, e.stageH);
		}
		
		private function closeMapHandler(e:EditEvent):void 
		{
			if (editAreaView.parent) editAreaView.parent.removeChild(editAreaView);
		}
		override public function onRemove():void 
		{
			super.onRemove();
			contextView.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			if (mouseStyle.parent) mouseStyle.parent.removeChild(mouseStyle);
			mouseStyle.dispose();
			editAreaView.dispose();
			removeContextListener(EditEvent.CLOSE_EDIT_MAP, closeMapHandler, EditEvent);
			editAreaView = null;
		}
	}

}
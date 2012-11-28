package me.xplabs.res.model 
{
	import com.greensock.events.LoaderEvent;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.IFileLoader;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.interfaces.IResName;
	import me.xplabs.utils.Domain;
	import mx.controls.Alert;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class FileLoaderRes extends Actor implements IResName,IFileLoader
	{
		[Inject]
		public var resLibrary:IResLibrary;
		private var _file:File;
		private var _files:Array;
		private var _resNumDict:Dictionary;
		public function FileLoaderRes() 
		{
			super();
			_file = File.applicationDirectory;
			_file.url = _file.url + Domain.res;
			_files = [];
			_resNumDict = new Dictionary();
		}
		
		public function loadRes(pkey:String):void
		{
			var tempList :Array = _file.getDirectoryListing();
			var len:int = tempList.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (tempList[i].name == pkey)
				{
					var tempFiles:Array = File(tempList[i]).getDirectoryListing();
					_files = _files.concat(tempFiles);
					_resNumDict[pkey] = new Vector.<String>();
					for (var j:int = 0; j < tempFiles.length; j++) 
					{
						_resNumDict[pkey].push(File(tempFiles[j]).name);
					}
					break;
				}
			}
		}
		public function starLoad():void
		{
			var len:int = _files.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (i == len - 1) resLibrary.parse(_files[i].url, { onComplete:resLoaderCompleteHandler } );
				else resLibrary.parse(_files[i].url);
			}
			_files.length = 0;
		}
		
		/* INTERFACE me.xplabs.interfaces.IResName */
		
		public function getResName(pkey:String):Vector.<String> 
		{
			return _resNumDict[pkey];
		}
		
		private function resLoaderCompleteHandler(e:LoaderEvent):void 
		{
			Alert.show("资源加载完毕，可以进行创建地图");
			trace(resLibrary.getResObj(Domain.stone + 1 + ".swf"));
		}
	}
}
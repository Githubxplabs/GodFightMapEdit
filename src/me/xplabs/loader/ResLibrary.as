package me.xplabs.loader 
{
	import com.greensock.loading.BinaryDataLoader;
	import com.greensock.loading.core.LoaderCore;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.XMLLoader;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.utils.Domain;
	import me.xplabs.utils.Utils;
	/**
	 * 资源管理器
	 * ...
	 * @author xiaohan
	 */
	public class ResLibrary implements IResLibrary
	{
		private var _loadrContext:LoaderContext
		private var _applicationDomain:ApplicationDomain;
		
		private var _resLib:Dictionary;
		
		//private var _domain:Domain;
		public function ResLibrary() 
		{
			//_domain = new Domain();
			_applicationDomain = new ApplicationDomain();
			_loadrContext = new LoaderContext(false, _applicationDomain, null);
			LoaderMax.defaultContext = _loadrContext;
			LoaderMax.activate([SWFLoader, XMLLoader, BinaryDataLoader]);
			_resLib = new Dictionary();
			
		}
		/**
		 * 加载资源
		 * @param	data 
		 * @param	vars 可参见LoaderMaxVars
		 * @param	childrenVars
		 * @return
		 */
		public function parse(data:*, vars:Object = null, childrenVars:Object = null):*
		{
			print(data);
			if (data is Array)
			{
				var len:int = data.length;
				for (var i:int = len - 1; i >= 0; i--) 
				{
					if (hasResObj(data[i]))
					{
						data.splice(i, 1);
					}
				}
			}
			LoaderCore(LoaderMax.parse(data, vars, childrenVars)).load();
		}
		/**
		 * 获取加载的资源
		 * @param	pkey 域名
		 * @param	cache 是否缓存资源
		 * @return
		 */
		public function getResObj(pkey:String,cache:Boolean = true):*
		{
			if (pkey.slice(pkey.lastIndexOf(".")) == ".xml" || pkey.slice(pkey.lastIndexOf(".")) == ".map")
			{
				tempObj = LoaderMax.getContent(pkey);
				if(!tempObj)
					print("你获取的资源 " + pkey + " 不存在");
				return tempObj;
			}else if (pkey.slice(pkey.lastIndexOf(".")) == ".swf")
			{
				pkey = pkey.slice(0, pkey.lastIndexOf("."));
			}
			pkey = Domain.format_getRes(pkey);
			var tempObj:* = _resLib[pkey];
			if (tempObj)
			{
				return tempObj;
			}
			if (!_applicationDomain.hasDefinition(pkey))
			{
				print("你获取的资源 " + pkey + " 不存在");
				return null;
			}
			var tempClass:* = _applicationDomain.getDefinition(pkey);
			try 
			{
				 tempObj = new tempClass();
			}catch (err:Error)
			{
				//tempObj = new tempClass(0, 0);
				tempObj = new tempClass(0);
			}
			if (cache) _resLib[pkey] = tempObj;
			return tempObj;
		}
		public function hasResObj(pkey:String):Boolean
		{
			pkey = Domain.format_getRes(pkey);
			if (!_applicationDomain.hasDefinition(pkey))
			{
				print("你获取的资源 " + pkey + " 不存在");
				return false;
			}
			return true;
		}
	}
}
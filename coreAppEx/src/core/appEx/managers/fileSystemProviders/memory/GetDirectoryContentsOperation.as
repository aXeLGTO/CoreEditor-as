// Copyright (c) 2012, Unwrong Ltd. http://www.unwrong.com
// All rights reserved. 

package core.appEx.managers.fileSystemProviders.memory
{
	import flash.events.Event;
	
	import core.app.core.managers.fileSystemProviders.IFileSystemProvider;
	import core.app.core.managers.fileSystemProviders.operations.IGetDirectoryContentsOperation;
	import core.app.entities.URI;
	import core.app.util.AsynchronousUtil;

	internal class GetDirectoryContentsOperation extends MemoryFileSystemProviderOperation implements IGetDirectoryContentsOperation
	{
		private var _contents	:Vector.<URI>;
		
		public function GetDirectoryContentsOperation(uri:URI, table:Object, fileSystemProvider:IFileSystemProvider)
		{
			super(uri, table, fileSystemProvider);
		}
		
		override public function execute():void
		{
			_contents = new Vector.<URI>();
			var path:String = _uri.path;
			for ( var currentPath:String in table )
			{
				if ( currentPath == path ) continue;
				var index:int = currentPath.indexOf(path);
				if ( currentPath.indexOf(path) == -1 ) continue;
				index += path.length;
				var subString:String = currentPath.substr(index);
				var maxSplit:int = 1;
				if ( subString.charAt(subString.length-1) == "/" )
				{
					maxSplit = 2;
				}
				if ( subString.split("/").length > maxSplit ) continue;
				
				_contents.push( new URI( currentPath ) );
			}
			
			AsynchronousUtil.dispatchLater(this, new Event( Event.COMPLETE ));
		}
		
		public function get contents():Vector.<URI> { return _contents.slice(); }
	}
}
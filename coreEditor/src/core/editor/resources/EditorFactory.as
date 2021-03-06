// Copyright (c) 2012, Unwrong Ltd. http://www.unwrong.com
// All rights reserved. 

package core.editor.resources
{
	import core.app.resources.FactoryResource;

	public class EditorFactory extends FactoryResource
	{
		public var extensions		:Array;
		
		public function EditorFactory( type:Class, label:String, extensions:String, icon:Class=null )
		{
			super( type, label, icon );
			this.extensions = extensions.split( "," );
		}
	}
}
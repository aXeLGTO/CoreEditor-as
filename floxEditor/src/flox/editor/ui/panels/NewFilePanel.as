// Copyright (c) 2012, Unwrong Ltd. http://www.unwrong.com
// All rights reserved. 

package flox.editor.ui.panels
{
	import flash.events.Event;
	
	import flox.ui.util.FloxDeserializer;
	
	import flox.editor.FloxEditor;
	import flox.ui.components.Button;
	import flox.ui.components.List;
	import flox.ui.components.Panel;
	import flox.editor.ui.components.FileTemplateItemRenderer;

	public class NewFilePanel extends Panel
	{
		public var list				:List;
		public var okBtn			:Button;
		public var cancelBtn		:Button;
		
		public function NewFilePanel()
		{
			
		}
		
		override protected function init():void
		{
			super.init();
			
			var xml:XML = 
			<Panel width="524" height="400" label="Select File Template" showCloseButton="false">
				
				<List id="list" width="100%" height="100%" />
				
				<controlBar>
					<Button label="OK" id="okBtn"/>
					<Button label="Cancel" id="cancelBtn"/>
				</controlBar>
				
			</Panel>
				
			FloxDeserializer.deserialize( xml, this );
			defaultButton = okBtn;
			list.addEventListener( Event.CHANGE, listChangeHandler );
			list.itemRendererClass = FileTemplateItemRenderer;
			
			validateInput();
		}
		
		private function listChangeHandler( event:Event ):void
		{
			validateInput();
		}
		
		public function validateInput():void
		{
			okBtn.enabled = list.selectedItem != null;
		}
	}
}
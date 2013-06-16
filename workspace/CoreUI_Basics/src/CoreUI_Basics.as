package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import core.ui.components.Label;
	import core.ui.components.TextArea;
	import core.ui.components.TextStyles;
	import core.ui.managers.FocusManager;
	import core.ui.util.SelectionColor;
	
	[SWF( width="400", height="600", backgroundColor="0x101010", frameRate="60" )]
	public class CoreUI_Basics extends Sprite
	{
		public function CoreUI_Basics()
		{
			new FocusManager();
			
			var textArea:TextArea = new TextArea();
			textArea.text = "textArea1";
			addChild(textArea);
			
			var textArea2:TextArea = new TextArea();
			textArea2.text = "textArea2";
			textArea2.y = 30;
			textArea2.showBorder = false;
			textArea2.bold = true;
			textArea2.editable = true;
			addChild(textArea2);
			
			var label:Label = new Label();
			label.text = "label";
			label.y = 60;
			addChild(label);
			
			var tf:TextField = TextStyles.createTextField();
			tf.text = "textfield";
			tf.y = 90;
			addChild(tf);
			
			SelectionColor.setFieldSelectionColor(tf, 0xCCCCCC)
		}
	}
}
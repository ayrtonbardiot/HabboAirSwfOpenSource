// by nota

//com.sulake.habbo.window.widgets.IlluminaInputWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class IlluminaInputWidget implements IIlluminaInputWidget 
    {

        public static const TYPE:String = "illumina_input";
        private static const _SafeStr_9180:String = "illumina_input:button_caption";
        private static const _SafeStr_9181:String = "illumina_input:empty_message";
        private static const MULTILINE_KEY:String = "illumina_input:multiline";
        private static const MAX_CHARS_KEY:String = "illumina_input:max_chars";
        private static const BUTTON_CAPTION_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:button_caption", "${widgets.chatinput.say}", "String");
        private static const EMPTY_MESSAGE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:empty_message", "", "String");
        private static const MULTILINE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:multiline", false, "Boolean");
        private static const MAX_CHARS_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:max_chars", 0, "int");
        private static const SINGLE_LINE_HEIGHT:int = 28;

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _submitButton:_SafeStr_3122;
        private var _SafeStr_6000:ITextFieldWindow;
        private var _emptyMessageLabel:ILabelWindow;
        private var _SafeStr_6504:IIlluminaInputHandler;

        public function IlluminaInputWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("illumina_input_xml").content as XML)) as _SafeStr_3133);
            _SafeStr_5428.width = _SafeStr_5427.width;
            _submitButton = (_SafeStr_5428.findChildByName("submit") as _SafeStr_3122);
            _SafeStr_6000 = (_SafeStr_5428.findChildByName("input") as ITextFieldWindow);
            _emptyMessageLabel = (_SafeStr_5428.findChildByName("empty_message") as ILabelWindow);
            buttonCaption = BUTTON_CAPTION_DEFAULT.value;
            emptyMessage = EMPTY_MESSAGE_DEFAULT.value;
            multiline = MULTILINE_DEFAULT.value;
            maxChars = MAX_CHARS_DEFAULT.value;
            refresh();
            _SafeStr_5428.procedure = widgetProcedure;
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_6000 != null)
                {
                    _SafeStr_6000 = null;
                };
                _submitButton = null;
                _emptyMessageLabel = null;
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(BUTTON_CAPTION_DEFAULT.withValue(buttonCaption));
            _local_1.push(EMPTY_MESSAGE_DEFAULT.withValue(emptyMessage));
            _local_1.push(MULTILINE_DEFAULT.withValue(multiline));
            _local_1.push(MAX_CHARS_DEFAULT.withValue(maxChars));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            if (_disposed)
            {
                return;
            };
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "illumina_input:button_caption":
                        buttonCaption = _local_2.value;
                        break;
                    case "illumina_input:empty_message":
                        emptyMessage = _local_2.value;
                        break;
                    case "illumina_input:multiline":
                        multiline = _local_2.value;
                        break;
                    case "illumina_input:max_chars":
                        maxChars = _local_2.value;
                };
            };
        }

        public function get buttonCaption():String
        {
            return (_submitButton.caption);
        }

        public function set buttonCaption(_arg_1:String):void
        {
            _submitButton.caption = _arg_1;
            _submitButton.visible = ((!(_arg_1 == null)) && (_arg_1.length > 0));
            refresh();
        }

        public function get emptyMessage():String
        {
            return (_emptyMessageLabel.caption);
        }

        public function set emptyMessage(_arg_1:String):void
        {
            _emptyMessageLabel.caption = _arg_1;
        }

        public function get multiline():Boolean
        {
            return (_SafeStr_6000.multiline);
        }

        public function set multiline(_arg_1:Boolean):void
        {
            _SafeStr_6000.multiline = _arg_1;
            _SafeStr_5428.setParamFlag(0x0800, _arg_1);
            _SafeStr_5428.height = ((_arg_1) ? _SafeStr_5427.height : 28);
        }

        public function get maxChars():int
        {
            return (_SafeStr_6000.maxChars);
        }

        public function set maxChars(_arg_1:int):void
        {
            _SafeStr_6000.maxChars = _arg_1;
        }

        public function get message():String
        {
            return (_SafeStr_6000.caption);
        }

        public function set message(_arg_1:String):void
        {
            _SafeStr_6000.caption = _arg_1;
            refresh();
        }

        public function get submitHandler():IIlluminaInputHandler
        {
            return (_SafeStr_6504);
        }

        public function set submitHandler(_arg_1:IIlluminaInputHandler):void
        {
            _SafeStr_6504 = _arg_1;
        }

        private function widgetProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WE_CHANGE":
                    if (_arg_2 == _SafeStr_6000)
                    {
                        refresh();
                    };
                    return;
                case "WKE_KEY_DOWN":
                    if ((((_arg_2 == _SafeStr_6000) && (WindowKeyboardEvent(_arg_1).charCode == 13)) && (_submitButton.visible)))
                    {
                        submitMessage();
                    };
                    return;
                case "WME_CLICK":
                    if (_arg_2 == _submitButton)
                    {
                        submitMessage();
                    };
                    return;
            };
        }

        private function submitMessage():void
        {
            if (_SafeStr_6504 != null)
            {
                _SafeStr_6504.onInput(_SafeStr_5427, message);
            };
        }

        private function refresh():void
        {
            _emptyMessageLabel.visible = (_SafeStr_6000.length == 0);
            _SafeStr_6000.width = (((_submitButton.visible) ? _submitButton.x : _SafeStr_5428.width) - (_SafeStr_6000.x * 2));
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_6000 = "_-R1l" (String#822, DoABC#4)
// _SafeStr_6504 = "_-O1S" (String#11533, DoABC#4)
// _SafeStr_9180 = "_-Ig" (String#39953, DoABC#4)
// _SafeStr_9181 = "_-21m" (String#34131, DoABC#4)



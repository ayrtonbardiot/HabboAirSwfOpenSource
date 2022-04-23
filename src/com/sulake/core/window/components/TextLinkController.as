// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.TextLinkController

package com.sulake.core.window.components
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events._SafeStr_3116;

    public class TextLinkController extends TextController implements ITextLinkWindow 
    {

        private var _SafeStr_4455:uint;
        private var _toolTipCaption:String;
        private var _SafeStr_4459:Boolean;
        protected var _SafeStr_5458:_SafeStr_24;

        public function TextLinkController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            var _local_12:IThemeManager = _arg_5.getWindowFactory().getThemeManager();
            _SafeStr_4455 = _local_12.getPropertyDefaults(_arg_3).get("tool_tip_delay").value;
            _toolTipCaption = _local_12.getPropertyDefaults(_arg_3).get("tool_tip_caption").value;
            _SafeStr_4459 = _local_12.getPropertyDefaults(_arg_3).get("tool_tip_is_dynamic").value;
            super(_arg_1, _arg_2, _arg_3, ((_arg_4 | 0x01) & (~(0x10))), _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            immediateClickMode = true;
            mouseThreshold = 0;
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            var _local_3:Boolean = super.update(_arg_1, _arg_2);
            if (_arg_1 == this)
            {
                InteractiveController.processInteractiveWindowEvents(this, _arg_2);
            };
            return (_local_3);
        }

        public function set mouseCursorType(_arg_1:uint):void
        {
        }

        public function get mouseCursorType():uint
        {
            return (0);
        }

        public function set toolTipCaption(_arg_1:String):void
        {
            _toolTipCaption = ((_arg_1 == null) ? "" : _arg_1);
        }

        public function get toolTipCaption():String
        {
            return (_toolTipCaption);
        }

        public function set toolTipDelay(_arg_1:uint):void
        {
            _SafeStr_4455 = _arg_1;
        }

        public function get toolTipDelay():uint
        {
            return (_SafeStr_4455);
        }

        public function setMouseCursorForState(_arg_1:uint, _arg_2:uint):uint
        {
            if (!_SafeStr_5458)
            {
                _SafeStr_5458 = new _SafeStr_24();
            };
            var _local_3:uint = _SafeStr_5458[_arg_1];
            if (((_arg_2 == 0) || (_arg_2 == -1)))
            {
                _SafeStr_5458.remove(_arg_1);
            }
            else
            {
                _SafeStr_5458[_arg_1] = _arg_2;
            };
            return (_local_3);
        }

        public function getMouseCursorByState(_arg_1:uint):uint
        {
            if (!_SafeStr_5458)
            {
                return (0);
            };
            return (_SafeStr_5458.getValue(_arg_1));
        }

        public function showToolTip(_arg_1:IToolTipWindow):void
        {
            throw (new Error("Unimplemented method!"));
        }

        public function hideToolTip():void
        {
            throw (new Error("Unimplemented method!"));
        }

        override public function get properties():Array
        {
            return (InteractiveController.writeInteractiveWindowProperties(this, super.properties));
        }

        override public function set properties(_arg_1:Array):void
        {
            InteractiveController.readInteractiveWindowProperties(this, _arg_1);
            super.properties = _arg_1;
        }

        public function set toolTipIsDynamic(_arg_1:Boolean):void
        {
            _SafeStr_4459 = _arg_1;
        }

        public function get toolTipIsDynamic():Boolean
        {
            return (_SafeStr_4459);
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4455 = "_-2h" (String#2981, DoABC#4)
// _SafeStr_4459 = "_-Z1A" (String#3905, DoABC#4)
// _SafeStr_5458 = "_-h1" (String#3042, DoABC#4)



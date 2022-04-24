// by nota

//com.sulake.habbo.window.utils.AlertDialogCaption

package com.sulake.habbo.window.utils
{
    public class AlertDialogCaption implements ICaption 
    {

        private var _text:String;
        private var _SafeStr_6036:String;
        private var _SafeStr_4426:Boolean;

        public function AlertDialogCaption(_arg_1:String, _arg_2:String, _arg_3:Boolean)
        {
            _text = _arg_1;
            _SafeStr_6036 = _arg_2;
            _SafeStr_4426 = _arg_3;
        }

        public function get text():String
        {
            return (_text);
        }

        public function set text(_arg_1:String):void
        {
            _text = _arg_1;
        }

        public function get toolTip():String
        {
            return (_SafeStr_6036);
        }

        public function set toolTip(_arg_1:String):void
        {
            _SafeStr_6036 = _arg_1;
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function set visible(_arg_1:Boolean):void
        {
            _SafeStr_4426 = _arg_1;
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_6036 = "_-xF" (String#11791, DoABC#4)



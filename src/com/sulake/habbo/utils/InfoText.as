// by nota

//com.sulake.habbo.utils.InfoText

package com.sulake.habbo.utils
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;

    public class InfoText 
    {

        private var _SafeStr_6142:ITextFieldWindow;
        private var _includeInfo:Boolean;
        private var _SafeStr_4787:String = "";

        public function InfoText(_arg_1:ITextFieldWindow, _arg_2:String=null)
        {
            _SafeStr_6142 = _arg_1;
            if (_arg_2 != null)
            {
                _includeInfo = true;
                _SafeStr_4787 = _arg_2;
                _SafeStr_6142.text = _arg_2;
            };
            _SafeStr_6142.addEventListener("WE_FOCUSED", onFocus);
        }

        public function dispose():void
        {
            if (_SafeStr_6142)
            {
                _SafeStr_6142.dispose();
                _SafeStr_6142 = null;
            };
        }

        public function goBackToInitialState():void
        {
            _SafeStr_6142.text = _SafeStr_4787;
            _includeInfo = true;
        }

        public function getText():String
        {
            return ((_includeInfo) ? "" : _SafeStr_6142.text);
        }

        public function setText(_arg_1:String):void
        {
            _includeInfo = false;
            _SafeStr_6142.text = _arg_1;
        }

        public function get input():ITextFieldWindow
        {
            return (_SafeStr_6142);
        }

        private function onFocus(_arg_1:_SafeStr_3116):void
        {
            if (!_includeInfo)
            {
                return;
            };
            _SafeStr_6142.text = "";
            _includeInfo = false;
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4787 = "_-B1D" (String#4933, DoABC#4)
// _SafeStr_6142 = "_-DD" (String#2126, DoABC#4)



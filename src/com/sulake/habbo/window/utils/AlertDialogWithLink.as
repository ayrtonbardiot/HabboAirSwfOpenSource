// by nota

//com.sulake.habbo.window.utils.AlertDialogWithLink

package com.sulake.habbo.window.utils
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3122;

    public class AlertDialogWithLink extends AlertDialog implements _SafeStr_3126 
    {

        protected var _linkTitle:String = "";
        protected var _SafeStr_4421:String = "";

        public function AlertDialogWithLink(_arg_1:_SafeStr_1695, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:uint, _arg_8:Function)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_7, _arg_8, false);
            this.linkTitle = _arg_5;
            this.linkUrl = _arg_6;
        }

        override protected function dialogEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "_alert_button_link":
                        HabboWebTools.navigateToURL(_SafeStr_4421, "_empty");
                        return;
                };
            };
            super.dialogEventProc(_arg_1, _arg_2);
        }

        public function set linkTitle(_arg_1:String):void
        {
            _linkTitle = _arg_1;
            if (_window)
            {
                _SafeStr_3122(_window.findChildByTag("LINK")).caption = _linkTitle;
            };
        }

        public function get linkTitle():String
        {
            return (_linkTitle);
        }

        public function set linkUrl(_arg_1:String):void
        {
            _SafeStr_4421 = _arg_1;
        }

        public function get linkUrl():String
        {
            return (_SafeStr_4421);
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3126 = "_-c1" (String#11584, DoABC#4)
// _SafeStr_4421 = "_-F18" (String#14882, DoABC#4)



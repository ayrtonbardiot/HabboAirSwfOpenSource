// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.utils.ConfirmDialog

package com.sulake.habbo.window.utils
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class ConfirmDialog extends AlertDialog implements _SafeStr_3198 
    {

        public function ConfirmDialog(_arg_1:_SafeStr_1695, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function, _arg_7:Boolean)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
        }

        override protected function dialogEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "_alert_button_ok":
                        if (_callback != null)
                        {
                            _local_3 = _SafeStr_3116.allocate("WE_OK", null, null);
                            (_callback(this, _local_3));
                            _local_3.recycle();
                        };
                        return;
                    case "_alert_button_cancel":
                    case "header_button_close":
                        if (_callback != null)
                        {
                            _local_3 = _SafeStr_3116.allocate("WE_CANCEL", null, null);
                            (_callback(this, _local_3));
                            _local_3.recycle();
                        };
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)



// by nota

//com.sulake.habbo.moderation.OpenUserInfo

package com.sulake.habbo.moderation
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class OpenUserInfo 
    {

        private var _frame:_SafeStr_3263;
        private var _main:ModerationManager;
        private var _SafeStr_4128:int;

        public function OpenUserInfo(_arg_1:_SafeStr_3263, _arg_2:ModerationManager, _arg_3:_SafeStr_3109, _arg_4:int)
        {
            _frame = _arg_1;
            _main = _arg_2;
            _SafeStr_4128 = _arg_4;
            _arg_3.procedure = onClick;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.windowTracker.show(new UserInfoFrameCtrl(_main, _SafeStr_4128), _frame, false, false, true);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)



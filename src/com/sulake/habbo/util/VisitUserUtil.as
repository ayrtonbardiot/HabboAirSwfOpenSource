// by nota

//com.sulake.habbo.util.VisitUserUtil

package com.sulake.habbo.util
{
    import com.sulake.habbo.moderation.ModerationManager;
    import com.sulake.core.window._SafeStr_3109;
    import _-Po._SafeStr_428;
    import com.sulake.core.window.events._SafeStr_3116;

    public class VisitUserUtil 
    {

        private var _main:ModerationManager;
        private var _SafeStr_4128:int;

        public function VisitUserUtil(_arg_1:ModerationManager, _arg_2:_SafeStr_3109, _arg_3:int)
        {
            _main = _arg_1;
            _SafeStr_4128 = _arg_3;
            _arg_2.procedure = onClick;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.connection.send(new _SafeStr_428(_SafeStr_4128));
        }


    }
}//package com.sulake.habbo.util

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_428 = "_-5Z" (String#7229, DoABC#4)



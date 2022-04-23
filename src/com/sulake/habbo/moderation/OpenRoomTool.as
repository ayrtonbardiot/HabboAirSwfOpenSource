// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.OpenRoomTool

package com.sulake.habbo.moderation
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class OpenRoomTool 
    {

        private var _frame:_SafeStr_3263;
        private var _main:ModerationManager;
        private var _SafeStr_3693:int;

        public function OpenRoomTool(_arg_1:_SafeStr_3263, _arg_2:ModerationManager, _arg_3:_SafeStr_3109, _arg_4:int)
        {
            _frame = _arg_1;
            _main = _arg_2;
            _SafeStr_3693 = _arg_4;
            _arg_3.procedure = onClick;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.windowTracker.show(new RoomToolCtrl(_main, _SafeStr_3693), _frame, false, false, true);
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)



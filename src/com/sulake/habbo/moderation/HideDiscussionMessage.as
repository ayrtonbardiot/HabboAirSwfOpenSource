// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.HideDiscussionMessage

package com.sulake.habbo.moderation
{
    import com.sulake.core.window._SafeStr_3109;
    import _-VM._SafeStr_614;
    import com.sulake.core.window.events._SafeStr_3116;

    public class HideDiscussionMessage 
    {

        private var _main:ModerationManager;
        private var _popup:ChatlogCtrl;
        private var _groupId:int;
        private var _SafeStr_5640:int;
        private var _SafeStr_6578:int;

        public function HideDiscussionMessage(_arg_1:ModerationManager, _arg_2:ChatlogCtrl, _arg_3:_SafeStr_3109, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            _main = _arg_1;
            _popup = _arg_2;
            _groupId = _arg_4;
            _SafeStr_5640 = _arg_5;
            _SafeStr_6578 = _arg_6;
            _arg_3.procedure = onClick;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _popup.dispose();
            _main.connection.send(new _SafeStr_614(_groupId, _SafeStr_5640, _SafeStr_6578, 20));
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_5640 = "_-lE" (String#3862, DoABC#4)
// _SafeStr_614 = "_-9V" (String#12896, DoABC#4)
// _SafeStr_6578 = "_-RO" (String#10230, DoABC#4)



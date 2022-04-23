// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.OpenRoomInSpectatorMode

package com.sulake.habbo.moderation
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class OpenRoomInSpectatorMode 
    {

        private var _main:ModerationManager;
        private var _SafeStr_3693:int;

        public function OpenRoomInSpectatorMode(_arg_1:ModerationManager, _arg_2:_SafeStr_3109, _arg_3:int)
        {
            _main = _arg_1;
            _SafeStr_3693 = _arg_3;
            _arg_2.procedure = onClick;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.goToRoom(_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)



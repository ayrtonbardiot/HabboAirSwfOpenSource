// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.GuildKickData

package com.sulake.habbo.groups
{
    public class GuildKickData 
    {

        private var _SafeStr_5058:int;
        private var _SafeStr_5059:int;
        private var _SafeStr_5060:Boolean;

        public function GuildKickData(_arg_1:int, _arg_2:int, _arg_3:Boolean=false)
        {
            _SafeStr_5058 = _arg_1;
            _SafeStr_5059 = _arg_2;
            _SafeStr_5060 = _arg_3;
        }

        public function get kickTargetId():int
        {
            return (_SafeStr_5058);
        }

        public function get kickGuildId():int
        {
            return (_SafeStr_5059);
        }

        public function get targetBlocked():Boolean
        {
            return (_SafeStr_5060);
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_5058 = "_-PN" (String#18917, DoABC#4)
// _SafeStr_5059 = "_-G1B" (String#19227, DoABC#4)
// _SafeStr_5060 = "_-aA" (String#19273, DoABC#4)



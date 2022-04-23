// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.GuildInfoCtrl

package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import _-Ja._SafeStr_1569;
    import _-XO._SafeStr_197;
    import com.sulake.core.window.events._SafeStr_3116;

    public class GuildInfoCtrl implements _SafeStr_13 
    {

        private static const GUILD_INFO_NAME:String = "guild_info";

        private var _navigator:_SafeStr_1697;
        private var _groupId:int;

        public function GuildInfoCtrl(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        public function dispose():void
        {
            _navigator = null;
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        public function refresh(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1569, _arg_3:Boolean=false):void
        {
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("guild_info"));
            if (_local_5 == null)
            {
                _local_5 = _SafeStr_3133(_navigator.getXmlWindow("guild_info"));
                _local_5.name = "guild_info";
                _arg_1.addChild(_local_5);
                _local_5.addEventListener("WME_CLICK", onGuildInfo);
            };
            if (((_arg_2 == null) || (_arg_2.habboGroupId < 1)))
            {
                _local_5.visible = false;
                return;
            };
            _local_5.visible = true;
            _navigator.registerParameter("navigator.guildbase", "groupName", _arg_2.groupName);
            _local_5.findChildByName("guild_base_txt").caption = _navigator.getText("navigator.guildbase");
            var _local_4:_SafeStr_3349 = (_SafeStr_3199(_arg_1.findChildByName("guild_badge")).widget as _SafeStr_3349);
            _local_4.badgeId = _arg_2.groupBadgeCode;
            _local_4.groupId = _arg_2.habboGroupId;
            _groupId = _arg_2.habboGroupId;
        }

        private function onGuildInfo(_arg_1:_SafeStr_3116):void
        {
            _navigator.send(new _SafeStr_197(_groupId, true));
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)



// by nota

//com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageEventHandler

package com.sulake.habbo.help.cfh.registry.instantmessage
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.help.HabboHelp;
    import _-JS._SafeStr_575;
    import _-JS._SafeStr_189;
    import _-wm._SafeStr_1405;
    import _-wm._SafeStr_1112;

    public class InstantMessageEventHandler implements _SafeStr_13 
    {

        private var _SafeStr_4147:HabboHelp;

        public function InstantMessageEventHandler(_arg_1:HabboHelp)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4147.addMessageEvent(new _SafeStr_575(onInstantMessage));
            _SafeStr_4147.addMessageEvent(new _SafeStr_189(onRoomInvite));
        }

        public function onInstantMessage(_arg_1:_SafeStr_575):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_2:_SafeStr_1405 = _arg_1.getParser();
            if (((_local_2.senderId < 0) && (!(_local_2.extraData == null))))
            {
                _local_4 = _local_2.extraData.split("/")[2];
                _local_3 = _local_2.extraData.split("/")[0];
                _SafeStr_4147.instantMessageRegistry.addItem(_local_2.senderId, ((_local_4 + ":") + _local_3), _local_2.messageText);
            }
            else
            {
                _SafeStr_4147.instantMessageRegistry.addItem(_local_2.senderId, "", _local_2.messageText);
            };
        }

        public function onRoomInvite(_arg_1:_SafeStr_189):void
        {
            var _local_2:_SafeStr_1112 = _arg_1.getParser();
            _SafeStr_4147.instantMessageRegistry.addItem(_local_2.senderId, "", _local_2.messageText);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4147)
                {
                    _SafeStr_4147 = null;
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4147 == null);
        }


    }
}//package com.sulake.habbo.help.cfh.registry.instantmessage

// _SafeStr_1112 = "_-y1" (String#24596, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1405 = "_-mr" (String#23614, DoABC#4)
// _SafeStr_189 = "_-Uo" (String#7898, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_575 = "_-m1T" (String#8185, DoABC#4)



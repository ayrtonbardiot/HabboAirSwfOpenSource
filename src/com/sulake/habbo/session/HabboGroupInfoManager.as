// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.HabboGroupInfoManager

package com.sulake.habbo.session
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-y1x._SafeStr_844;
    import _-W1K._SafeStr_577;
    import _-XO._SafeStr_544;

    public class HabboGroupInfoManager implements _SafeStr_13 
    {

        private var _sessionDataManager:SessionDataManager;
        private var _SafeStr_4145:_SafeStr_24;
        private var _SafeStr_5054:IMessageEvent;
        private var _SafeStr_5055:IMessageEvent;

        public function HabboGroupInfoManager(_arg_1:SessionDataManager)
        {
            _sessionDataManager = _arg_1;
            _SafeStr_4145 = new _SafeStr_24();
            if (_sessionDataManager.communication)
            {
                _SafeStr_5054 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new _SafeStr_844(onRoomReady));
                _SafeStr_5055 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new _SafeStr_577(onHabboGroupBadges));
            };
        }

        public function get disposed():Boolean
        {
            return (_sessionDataManager == null);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_sessionDataManager.communication)
            {
                _sessionDataManager.communication.removeHabboConnectionMessageEvent(_SafeStr_5054);
                _sessionDataManager.communication.removeHabboConnectionMessageEvent(_SafeStr_5055);
            };
            _SafeStr_4145 = null;
            _sessionDataManager = null;
        }

        private function onRoomReady(_arg_1:IMessageEvent):void
        {
            _sessionDataManager.send(new _SafeStr_544());
        }

        private function onHabboGroupBadges(_arg_1:_SafeStr_577):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_2:_SafeStr_24 = _arg_1.badges;
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_3 = _local_2.getKey(_local_4);
                _SafeStr_4145.remove(_local_3);
                _SafeStr_4145.add(_local_3, _local_2.getWithIndex(_local_4));
                _local_4++;
            };
        }

        public function getBadgeId(_arg_1:int):String
        {
            return (_SafeStr_4145.getValue(_arg_1));
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)
// _SafeStr_5054 = "_-12e" (String#20639, DoABC#4)
// _SafeStr_5055 = "_-u1T" (String#5784, DoABC#4)
// _SafeStr_544 = "_-2c" (String#29456, DoABC#4)
// _SafeStr_577 = "_-22Z" (String#10958, DoABC#4)
// _SafeStr_844 = "_-9H" (String#4703, DoABC#4)



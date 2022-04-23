// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.IgnoredUsersManager

package com.sulake.habbo.session
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-W1K._SafeStr_516;
    import _-W1K._SafeStr_633;
    import _-XO._SafeStr_675;
    import _-XO._SafeStr_792;
    import _-XO._SafeStr_342;
    import _-XO._SafeStr_332;

    public class IgnoredUsersManager implements _SafeStr_13 
    {

        private var _sessionDataManager:SessionDataManager;
        private var _SafeStr_5368:IMessageEvent;
        private var _SafeStr_5369:IMessageEvent;
        private var _ignoredUsers:Array = [];

        public function IgnoredUsersManager(_arg_1:SessionDataManager)
        {
            _sessionDataManager = _arg_1;
            if (_sessionDataManager.communication)
            {
                _SafeStr_5368 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new _SafeStr_516(onIgnoreResult));
                _SafeStr_5369 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new _SafeStr_633(onIgnoreList));
            };
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_sessionDataManager.communication)
            {
                _sessionDataManager.communication.removeHabboConnectionMessageEvent(_SafeStr_5368);
                _sessionDataManager.communication.removeHabboConnectionMessageEvent(_SafeStr_5369);
            };
            _SafeStr_5368 = null;
            _SafeStr_5369 = null;
            _sessionDataManager = null;
        }

        public function initIgnoreList():void
        {
            _sessionDataManager.send(new _SafeStr_675(_sessionDataManager.userName));
        }

        private function onIgnoreList(_arg_1:_SafeStr_633):void
        {
            _ignoredUsers = _arg_1.ignoredUsers;
        }

        private function onIgnoreResult(_arg_1:_SafeStr_516):void
        {
            var _local_2:String = _arg_1.name;
            switch (_arg_1.result)
            {
                case 0:
                    return;
                case 1:
                    addUserToIgnoreList(_local_2);
                    return;
                case 2:
                    addUserToIgnoreList(_local_2);
                    _ignoredUsers.shift();
                    return;
                case 3:
                    removeUserFromIgnoreList(_local_2);
                default:
            };
        }

        private function addUserToIgnoreList(_arg_1:String):void
        {
            if (_ignoredUsers.indexOf(_arg_1) < 0)
            {
                _ignoredUsers.push(_arg_1);
            };
        }

        private function removeUserFromIgnoreList(_arg_1:String):void
        {
            var _local_2:int = _ignoredUsers.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                _ignoredUsers.splice(_local_2, 1);
            };
        }

        public function ignoreUserId(_arg_1:int):void
        {
            _sessionDataManager.send(new _SafeStr_792(_arg_1));
        }

        public function ignoreUser(_arg_1:String):void
        {
            _sessionDataManager.send(new _SafeStr_342(_arg_1));
        }

        public function unignoreUser(_arg_1:String):void
        {
            _sessionDataManager.send(new _SafeStr_332(_arg_1));
        }

        public function isIgnored(_arg_1:String):Boolean
        {
            return (_ignoredUsers.indexOf(_arg_1) >= 0);
        }

        public function get disposed():Boolean
        {
            return (_sessionDataManager == null);
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_332 = "_-6P" (String#30999, DoABC#4)
// _SafeStr_342 = "_-XI" (String#29325, DoABC#4)
// _SafeStr_516 = "_-w1k" (String#10357, DoABC#4)
// _SafeStr_5368 = "_-B1" (String#13216, DoABC#4)
// _SafeStr_5369 = "_-VJ" (String#12662, DoABC#4)
// _SafeStr_633 = "_-r5" (String#23363, DoABC#4)
// _SafeStr_675 = "_-d12" (String#28787, DoABC#4)
// _SafeStr_792 = "_-A1E" (String#12364, DoABC#4)



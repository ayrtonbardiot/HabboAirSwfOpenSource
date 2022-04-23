// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.cfh.registry.user.UserRegistry

package com.sulake.habbo.help.cfh.registry.user
{
    import com.sulake.core.utils._SafeStr_24;

    public class UserRegistry 
    {

        private static const MAX_USERS_TO_STORE:int = 80;

        private var _registry:_SafeStr_24 = new _SafeStr_24();
        private var _roomName:String = "";
        private var _SafeStr_3693:int;
        private var _SafeStr_5397:Array = [];


        public function getRegistry():_SafeStr_24
        {
            return (_registry);
        }

        public function getEntry(_arg_1:int):UserRegistryItem
        {
            return (_registry[_arg_1]);
        }

        public function registerRoom(_arg_1:int, _arg_2:String):void
        {
            _SafeStr_3693 = _arg_1;
            _roomName = _arg_2;
            if (_roomName != "")
            {
                addRoomNameForMissing();
            };
        }

        public function registerUser(_arg_1:int, _arg_2:String, _arg_3:String=""):void
        {
            var _local_4:* = null;
            if (_registry.getValue(_arg_1) != null)
            {
                _registry.remove(_arg_1);
            };
            _local_4 = new UserRegistryItem(_arg_1, _arg_2, _arg_3, _SafeStr_3693, _roomName);
            if (_roomName == "")
            {
                _SafeStr_5397.push(_arg_1);
            };
            _registry.add(_arg_1, _local_4);
            purgeUserIndex();
        }

        private function purgeUserIndex():void
        {
            var _local_1:int;
            while (_registry.length > 80)
            {
                _local_1 = _registry.getKey(0);
                _registry.remove(_local_1);
            };
        }

        private function addRoomNameForMissing():void
        {
            var _local_1:* = null;
            while (_SafeStr_5397.length > 0)
            {
                _local_1 = _registry.getValue(_SafeStr_5397.shift());
                if (((!(_local_1 == null)) && (_local_1.roomId == _SafeStr_3693)))
                {
                    _local_1.roomName = _roomName;
                };
            };
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.help.cfh.registry.user

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_5397 = "_-4k" (String#13003, DoABC#4)



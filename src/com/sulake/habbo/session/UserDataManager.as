// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.UserDataManager

package com.sulake.habbo.session
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.connection.IConnection;
    import _-XO._SafeStr_841;
    import _-m1i._SafeStr_629;

    public class UserDataManager implements _SafeStr_3273 
    {

        private static const TYPE_USER:int = 1;
        private static const TYPE_PET:int = 2;
        private static const _SafeStr_8928:int = 3;
        private static const _SafeStr_8929:int = 4;

        private var _SafeStr_6228:_SafeStr_24;
        private var _SafeStr_6229:_SafeStr_24;
        private var _SafeStr_6230:_SafeStr_24;
        private var _connection:IConnection;

        public function UserDataManager()
        {
            _SafeStr_6228 = new _SafeStr_24();
            _SafeStr_6229 = new _SafeStr_24();
            _SafeStr_6230 = new _SafeStr_24();
        }

        public function dispose():void
        {
            _connection = null;
            _SafeStr_6228.dispose();
            _SafeStr_6228 = null;
            _SafeStr_6229.dispose();
            _SafeStr_6229 = null;
            _SafeStr_6230.dispose();
            _SafeStr_6230 = null;
        }

        public function set connection(_arg_1:IConnection):void
        {
            _connection = _arg_1;
        }

        public function getUserData(_arg_1:int):_SafeStr_3241
        {
            return (getUserDataByType(_arg_1, 1));
        }

        public function getUserDataByType(_arg_1:int, _arg_2:int):_SafeStr_3241
        {
            var _local_3:_SafeStr_3241;
            var _local_4:_SafeStr_24 = _SafeStr_6228.getValue(_arg_2);
            if (_local_4 != null)
            {
                _local_3 = _local_4.getValue(_arg_1);
            };
            return (_local_3);
        }

        public function getUserDataByIndex(_arg_1:int):_SafeStr_3241
        {
            return (_SafeStr_6229.getValue(_arg_1));
        }

        public function getUserDataByName(_arg_1:String):_SafeStr_3241
        {
            for each (var _local_2:_SafeStr_3241 in _SafeStr_6229)
            {
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getUserBadges(_arg_1:int):Array
        {
            if (_connection != null)
            {
                _connection.send(new _SafeStr_841(_arg_1));
            };
            var _local_2:Array = (_SafeStr_6230.getValue(_arg_1) as Array);
            if (_local_2 == null)
            {
                _local_2 = [];
            };
            return (_local_2);
        }

        public function setUserData(_arg_1:_SafeStr_3241):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            removeUserDataByRoomIndex(_arg_1.roomObjectId);
            var _local_2:_SafeStr_24 = _SafeStr_6228.getValue(_arg_1.type);
            if (_local_2 == null)
            {
                _local_2 = new _SafeStr_24();
                _SafeStr_6228.add(_arg_1.type, _local_2);
            };
            _local_2.add(_arg_1.webID, _arg_1);
            _SafeStr_6229.add(_arg_1.roomObjectId, _arg_1);
        }

        public function removeUserDataByRoomIndex(_arg_1:int):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_2:_SafeStr_3241 = _SafeStr_6229.remove(_arg_1);
            if (_local_2 != null)
            {
                _local_4 = _SafeStr_6228.getValue(_local_2.type);
                if (_local_4 != null)
                {
                    _local_3 = _local_4.remove(_local_2.webID);
                    if (_local_3 != null)
                    {
                    };
                };
            };
        }

        public function setUserBadges(_arg_1:int, _arg_2:Array):void
        {
            _SafeStr_6230.remove(_arg_1);
            _SafeStr_6230.add(_arg_1, _arg_2);
        }

        public function updateFigure(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean):void
        {
            var _local_6:_SafeStr_3241 = getUserDataByIndex(_arg_1);
            if (_local_6 != null)
            {
                _local_6.figure = _arg_2;
                _local_6.sex = _arg_3;
                _local_6.hasSaddle = _arg_4;
                _local_6.isRiding = _arg_5;
            };
        }

        public function updatePetLevel(_arg_1:int, _arg_2:int):void
        {
            var _local_3:_SafeStr_3241 = getUserDataByIndex(_arg_1);
            if (_local_3 != null)
            {
                _local_3.petLevel = _arg_2;
            };
        }

        public function updatePetBreedingStatus(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean):void
        {
            var _local_6:_SafeStr_3241 = getUserDataByIndex(_arg_1);
            if (_local_6 != null)
            {
                _local_6.canBreed = _arg_2;
                _local_6.canHarvest = _arg_3;
                _local_6.canRevive = _arg_4;
                _local_6.hasBreedingPermission = _arg_5;
            };
        }

        public function updateCustom(_arg_1:int, _arg_2:String):void
        {
            var _local_3:_SafeStr_3241 = getUserDataByIndex(_arg_1);
            if (_local_3 != null)
            {
                _local_3.custom = _arg_2;
            };
        }

        public function updateAchievementScore(_arg_1:int, _arg_2:int):void
        {
            var _local_3:_SafeStr_3241 = getUserDataByIndex(_arg_1);
            if (_local_3 != null)
            {
                _local_3.achievementScore = _arg_2;
            };
        }

        public function updateNameByIndex(_arg_1:int, _arg_2:String):void
        {
            var _local_3:_SafeStr_3241 = getUserDataByIndex(_arg_1);
            if (_local_3 != null)
            {
                _local_3.name = _arg_2;
            };
        }

        public function getPetUserData(_arg_1:int):_SafeStr_3241
        {
            return (getUserDataByType(_arg_1, 2));
        }

        public function getRentableBotUserData(_arg_1:int):_SafeStr_3241
        {
            return (getUserDataByType(_arg_1, 4));
        }

        public function requestPetInfo(_arg_1:int):void
        {
            var _local_2:_SafeStr_3241 = getPetUserData(_arg_1);
            if (((!(_local_2 == null)) && (!(_connection == null))))
            {
                _connection.send(new _SafeStr_629(_local_2.webID));
            };
        }

        public function getAllUserIds():Array
        {
            var _local_2:Array = [];
            for each (var _local_1:_SafeStr_3241 in _SafeStr_6229)
            {
                _local_2.push(_local_1.webID);
            };
            return (_local_2);
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3273 = "_-ut" (String#11180, DoABC#4)
// _SafeStr_6228 = "_-B1T" (String#7750, DoABC#4)
// _SafeStr_6229 = "_-h1W" (String#6673, DoABC#4)
// _SafeStr_6230 = "_-ig" (String#8641, DoABC#4)
// _SafeStr_629 = "_-22V" (String#29576, DoABC#4)
// _SafeStr_841 = "_-vv" (String#18502, DoABC#4)
// _SafeStr_8928 = "_-as" (String#31736, DoABC#4)
// _SafeStr_8929 = "_-g1s" (String#38247, DoABC#4)



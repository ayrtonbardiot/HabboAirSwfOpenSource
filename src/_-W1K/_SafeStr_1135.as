// by nota

//_-W1K._SafeStr_1135

package _-W1K
{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1135 
    {

        private var _groupId:int;
        private var _groupName:String;
        private var _SafeStr_7453:int;
        private var _SafeStr_4723:String;
        private var _SafeStr_7650:int;
        private var _SafeStr_5093:Array;
        private var _SafeStr_7651:Boolean;
        private var _SafeStr_5746:int;
        private var _SafeStr_4784:int;
        private var _SafeStr_6109:int;
        private var _SafeStr_5010:String;
        private var _SafeStr_7649:Dictionary = new Dictionary();

        public function _SafeStr_1135(_arg_1:IMessageDataWrapper)
        {
            var _local_4:int;
            var _local_3:* = null;
            super();
            _groupId = _arg_1.readInteger();
            _groupName = _arg_1.readString();
            _SafeStr_7453 = _arg_1.readInteger();
            _SafeStr_4723 = _arg_1.readString();
            _SafeStr_7650 = _arg_1.readInteger();
            _SafeStr_5093 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_2)
            {
                _local_3 = new _SafeStr_1171(_arg_1);
                _SafeStr_5093.push(_local_3);
                _SafeStr_7649[_local_3.userId] = _local_3;
                _local_4++;
            };
            _SafeStr_7651 = _arg_1.readBoolean();
            _SafeStr_5746 = _arg_1.readInteger();
            _SafeStr_4784 = _arg_1.readInteger();
            _SafeStr_6109 = _arg_1.readInteger();
            _SafeStr_5010 = _arg_1.readString();
        }

        private static function removeFromArray(_arg_1:int, _arg_2:Array):void
        {
            var _local_4:int;
            var _local_3:* = null;
            while (_local_4 < _arg_2.length)
            {
                _local_3 = _arg_2[_local_4];
                if (_local_3.userId == _arg_1)
                {
                    _arg_2.splice(_local_4, 1);
                }
                else
                {
                    _local_4++;
                };
            };
        }


        public function get groupId():int
        {
            return (_groupId);
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function get baseRoomId():int
        {
            return (_SafeStr_7453);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get totalEntries():int
        {
            return (_SafeStr_7650);
        }

        public function get pageSize():int
        {
            return (_SafeStr_5746);
        }

        public function get pageIndex():int
        {
            return (_SafeStr_4784);
        }

        public function get searchType():int
        {
            return (_SafeStr_6109);
        }

        public function get entries():Array
        {
            return (_SafeStr_5093);
        }

        public function get allowedToManage():Boolean
        {
            return (_SafeStr_7651);
        }

        public function get userNameFilter():String
        {
            return (_SafeStr_5010);
        }

        public function get totalPages():int
        {
            return (Math.max(1, Math.ceil((_SafeStr_7650 / _SafeStr_5746))));
        }

        public function update(_arg_1:_SafeStr_1171):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _SafeStr_7649[_arg_1.userId] = _arg_1;
            while (_local_3 < _SafeStr_5093.length)
            {
                _local_2 = _SafeStr_5093[_local_3];
                if (_local_2.userId == _arg_1.userId)
                {
                    _SafeStr_5093[_local_3] = _arg_1;
                    return;
                };
                _local_3++;
            };
            _SafeStr_5093.push(_arg_1);
        }

        public function remove(_arg_1:int):void
        {
            removeFromArray(_arg_1, _SafeStr_5093);
            delete _SafeStr_7649[_arg_1]; //not popped
        }

        public function getUser(_arg_1:int):_SafeStr_1171
        {
            return (_SafeStr_7649[_arg_1]);
        }


    }
}//package _-W1K

// _SafeStr_1135 = "_-is" (String#9574, DoABC#3)
// _SafeStr_1171 = "_-rf" (String#10164, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_4784 = "_-vz" (String#10434, DoABC#3)
// _SafeStr_5010 = "_-K1V" (String#7875, DoABC#3)
// _SafeStr_5093 = "_-Pc" (String#8270, DoABC#3)
// _SafeStr_5746 = "_-T1m" (String#8489, DoABC#3)
// _SafeStr_6109 = "_-VG" (String#8636, DoABC#3)
// _SafeStr_7453 = "_-l1S" (String#9747, DoABC#3)
// _SafeStr_7649 = "_-ki" (String#9711, DoABC#3)
// _SafeStr_7650 = "_-R18" (String#8338, DoABC#3)
// _SafeStr_7651 = "_-GE" (String#7624, DoABC#3)



// by nota

//_-W1K._SafeStr_1109

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1109 implements _SafeStr_1108 
    {

        private var _SafeStr_7628:Array;
        private var _SafeStr_5902:Boolean;
        private var _groupId:int;
        private var _groupName:String;
        private var _SafeStr_7630:String;
        private var _SafeStr_7453:int;
        private var _SafeStr_7631:int;
        private var _SafeStr_7632:int;
        private var _SafeStr_5213:Boolean;
        private var _SafeStr_5275:String;
        private var _SafeStr_6594:int;
        private var _SafeStr_7633:int;
        private var _SafeStr_7629:Array;
        private var _SafeStr_4723:String;
        private var _SafeStr_7634:int;

        public function _SafeStr_1109(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            var _local_2:int;
            super();
            _SafeStr_7628 = [];
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7628.push(new _SafeStr_1571(_arg_1.readInteger(), _arg_1.readString(), _arg_1.readBoolean()));
                _local_3++;
            };
            _SafeStr_5902 = _arg_1.readBoolean();
            _groupId = _arg_1.readInteger();
            _groupName = _arg_1.readString();
            _SafeStr_7630 = _arg_1.readString();
            _SafeStr_7453 = _arg_1.readInteger();
            _SafeStr_7631 = _arg_1.readInteger();
            _SafeStr_7632 = _arg_1.readInteger();
            _SafeStr_6594 = _arg_1.readInteger();
            _SafeStr_7633 = _arg_1.readInteger();
            _SafeStr_5213 = _arg_1.readBoolean();
            _SafeStr_5275 = _arg_1.readString();
            _SafeStr_7629 = [];
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7629.push(new _SafeStr_1550(_arg_1));
                _local_3++;
            };
            _SafeStr_4723 = _arg_1.readString();
            _SafeStr_7634 = _arg_1.readInteger();
        }

        public function get ownedRooms():Array
        {
            return (_SafeStr_7628);
        }

        public function get exists():Boolean
        {
            return (true);
        }

        public function get isOwner():Boolean
        {
            return (_SafeStr_5902);
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function get groupDesc():String
        {
            return (_SafeStr_7630);
        }

        public function get baseRoomId():int
        {
            return (_SafeStr_7453);
        }

        public function get primaryColorId():int
        {
            return (_SafeStr_7631);
        }

        public function get secondaryColorId():int
        {
            return (_SafeStr_7632);
        }

        public function get badgeSettings():Array
        {
            return (_SafeStr_7629);
        }

        public function get locked():Boolean
        {
            return (_SafeStr_5213);
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get guildType():int
        {
            return (_SafeStr_6594);
        }

        public function get guildRightsLevel():int
        {
            return (_SafeStr_7633);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get membershipCount():int
        {
            return (_SafeStr_7634);
        }


    }
}//package _-W1K

// _SafeStr_1108 = "_-32v" (String#6759, DoABC#3)
// _SafeStr_1109 = "_-81H" (String#7074, DoABC#3)
// _SafeStr_1550 = "_-zY" (String#10696, DoABC#3)
// _SafeStr_1571 = "_-r1" (String#10109, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_5213 = "_-h18" (String#9458, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_5902 = "_-y1h" (String#10596, DoABC#3)
// _SafeStr_6594 = "_-pK" (String#10007, DoABC#3)
// _SafeStr_7453 = "_-l1S" (String#9747, DoABC#3)
// _SafeStr_7628 = "_-l1N" (String#9744, DoABC#3)
// _SafeStr_7629 = "_-1U" (String#6609, DoABC#3)
// _SafeStr_7630 = "_-av" (String#9032, DoABC#3)
// _SafeStr_7631 = "_-Aw" (String#7298, DoABC#3)
// _SafeStr_7632 = "_-j10" (String#9582, DoABC#3)
// _SafeStr_7633 = "_-dr" (String#9249, DoABC#3)
// _SafeStr_7634 = "_-p1k" (String#9994, DoABC#3)



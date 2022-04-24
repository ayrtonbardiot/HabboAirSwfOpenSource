// by nota

//_-W1K._SafeStr_1121

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1121 implements _SafeStr_1108 
    {

        private var _SafeStr_7635:int;
        private var _SafeStr_7628:Array;
        private var _SafeStr_7629:Array;

        public function _SafeStr_1121(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            var _local_2:int;
            super();
            _SafeStr_7635 = _arg_1.readInteger();
            _SafeStr_7628 = [];
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7628.push(new _SafeStr_1571(_arg_1.readInteger(), _arg_1.readString(), _arg_1.readBoolean()));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _SafeStr_7629 = [];
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7629.push(new _SafeStr_1550(_arg_1));
                _local_3++;
            };
        }

        public function get costInCredits():int
        {
            return (_SafeStr_7635);
        }

        public function get ownedRooms():Array
        {
            return (_SafeStr_7628);
        }

        public function get exists():Boolean
        {
            return (false);
        }

        public function get isOwner():Boolean
        {
            return (true);
        }

        public function get groupId():int
        {
            return (0);
        }

        public function get groupName():String
        {
            return ("");
        }

        public function get groupDesc():String
        {
            return ("");
        }

        public function get baseRoomId():int
        {
            return (0);
        }

        public function get primaryColorId():int
        {
            return (0);
        }

        public function get secondaryColorId():int
        {
            return (0);
        }

        public function get badgeSettings():Array
        {
            return (_SafeStr_7629);
        }

        public function get locked():Boolean
        {
            return (false);
        }

        public function get url():String
        {
            return ("");
        }

        public function get guildType():int
        {
            return (0);
        }

        public function get guildRightsLevel():int
        {
            return (0);
        }

        public function get badgeCode():String
        {
            return ("");
        }

        public function get membershipCount():int
        {
            return (0);
        }


    }
}//package _-W1K

// _SafeStr_1108 = "_-32v" (String#6759, DoABC#3)
// _SafeStr_1121 = "_-C1Z" (String#7365, DoABC#3)
// _SafeStr_1550 = "_-zY" (String#10696, DoABC#3)
// _SafeStr_1571 = "_-r1" (String#10109, DoABC#3)
// _SafeStr_7628 = "_-l1N" (String#9744, DoABC#3)
// _SafeStr_7629 = "_-1U" (String#6609, DoABC#3)
// _SafeStr_7635 = "_-UZ" (String#8585, DoABC#3)



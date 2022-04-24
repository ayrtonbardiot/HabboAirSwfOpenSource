// by nota

//_-W1K._SafeStr_1123

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1123 
    {

        public static const TYPE_REGULAR:int = 0;
        public static const TYPE_EXCLUSIVE:int = 1;
        public static const _SafeStr_7636:int = 2;
        public static const TYPE_LARGE:int = 3;
        public static const _SafeStr_7637:int = 4;
        public static const _SafeStr_7638:int = 0;
        public static const _SafeStr_7639:int = 1;
        public static const _SafeStr_7640:int = 2;

        private var _groupId:int;
        private var _SafeStr_7641:Boolean;
        private var _SafeStr_4028:int;
        private var _groupName:String;
        private var _description:String;
        private var _SafeStr_4723:String;
        private var _SafeStr_3693:int = -1;
        private var _roomName:String = "";
        private var _status:int;
        private var _SafeStr_7642:int;
        private var _SafeStr_7643:Boolean;
        private var _SafeStr_7644:String;
        private var _SafeStr_5902:Boolean;
        private var _isAdmin:Boolean;
        private var _ownerName:String;
        private var _SafeStr_7645:Boolean;
        private var _SafeStr_7646:Boolean;
        private var _SafeStr_7647:Boolean;
        private var _SafeStr_7648:int;

        public function _SafeStr_1123(_arg_1:IMessageDataWrapper)
        {
            _groupId = _arg_1.readInteger();
            _SafeStr_7641 = _arg_1.readBoolean();
            _SafeStr_4028 = _arg_1.readInteger();
            _groupName = _arg_1.readString();
            _description = _arg_1.readString();
            _SafeStr_4723 = _arg_1.readString();
            _SafeStr_3693 = _arg_1.readInteger();
            _roomName = _arg_1.readString();
            _status = _arg_1.readInteger();
            _SafeStr_7642 = _arg_1.readInteger();
            _SafeStr_7643 = _arg_1.readBoolean();
            _SafeStr_7644 = _arg_1.readString();
            _SafeStr_5902 = _arg_1.readBoolean();
            _isAdmin = _arg_1.readBoolean();
            _ownerName = _arg_1.readString();
            _SafeStr_7645 = _arg_1.readBoolean();
            _SafeStr_7647 = _arg_1.readBoolean();
            _SafeStr_7648 = _arg_1.readInteger();
            _SafeStr_7646 = _arg_1.readBoolean();
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get isGuild():Boolean
        {
            return (_SafeStr_7641);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get status():int
        {
            return (_status);
        }

        public function get totalMembers():int
        {
            return (_SafeStr_7642);
        }

        public function get favourite():Boolean
        {
            return (_SafeStr_7643);
        }

        public function get creationDate():String
        {
            return (_SafeStr_7644);
        }

        public function get isOwner():Boolean
        {
            return (_SafeStr_5902);
        }

        public function get isAdmin():Boolean
        {
            return (_isAdmin);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get openDetails():Boolean
        {
            return (_SafeStr_7645);
        }

        public function get membersCanDecorate():Boolean
        {
            return (_SafeStr_7647);
        }

        public function get pendingMemberCount():int
        {
            return (_SafeStr_7648);
        }

        public function get hasBoard():Boolean
        {
            return (_SafeStr_7646);
        }

        public function get joiningAllowed():Boolean
        {
            return ((_status == 0) && ((_SafeStr_4028 == 0) || (_SafeStr_4028 == 4)));
        }

        public function get requestMembershipAllowed():Boolean
        {
            return ((_status == 0) && (_SafeStr_4028 == 1));
        }

        public function get leaveAllowed():Boolean
        {
            return (((_SafeStr_7641) && (!(_SafeStr_5902))) && (_status == 1));
        }


    }
}//package _-W1K

// _SafeStr_1123 = "_-r1M" (String#10125, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_5902 = "_-y1h" (String#10596, DoABC#3)
// _SafeStr_7636 = "_-t17" (String#10243, DoABC#3)
// _SafeStr_7637 = "_-F1p" (String#7554, DoABC#3)
// _SafeStr_7638 = "_-o1t" (String#9939, DoABC#3)
// _SafeStr_7639 = "_-020" (String#6499, DoABC#3)
// _SafeStr_7640 = "_-b1L" (String#9048, DoABC#3)
// _SafeStr_7641 = "_-W8" (String#8730, DoABC#3)
// _SafeStr_7642 = "_-q1O" (String#10048, DoABC#3)
// _SafeStr_7643 = "_-LP" (String#7972, DoABC#3)
// _SafeStr_7644 = "_-n1G" (String#9859, DoABC#3)
// _SafeStr_7645 = "_-k1G" (String#9668, DoABC#3)
// _SafeStr_7646 = "_-ZG" (String#8934, DoABC#3)
// _SafeStr_7647 = "_-Oh" (String#8187, DoABC#3)
// _SafeStr_7648 = "_-uO" (String#10349, DoABC#3)



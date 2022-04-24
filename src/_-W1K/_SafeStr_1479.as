// by nota

//_-W1K._SafeStr_1479

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1479 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_4880:String;
        private var _SafeStr_7644:String;
        private var _achievementScore:int;
        private var _SafeStr_7663:int;
        private var _SafeStr_5879:Boolean;
        private var _SafeStr_7664:Boolean;
        private var _SafeStr_7665:Boolean;
        private var _SafeStr_7437:Array = [];
        private var _SafeStr_7666:int;
        private var _SafeStr_7667:Boolean;
        private var _SafeStr_7668:Boolean;
        private var _SafeStr_7669:int;
        private var _SafeStr_7670:int;
        private var _SafeStr_7671:int;
        private var _SafeStr_7672:Boolean;
        private var _SafeStr_7673:Boolean;

        public function _SafeStr_1479(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_4128 = _arg_1.readInteger();
            _userName = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_4880 = _arg_1.readString();
            _SafeStr_7644 = _arg_1.readString();
            _achievementScore = _arg_1.readInteger();
            _SafeStr_7663 = _arg_1.readInteger();
            _SafeStr_5879 = _arg_1.readBoolean();
            _SafeStr_7664 = _arg_1.readBoolean();
            _SafeStr_7665 = _arg_1.readBoolean();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7437.push(new _SafeStr_1637(_arg_1));
                _local_3++;
            };
            _SafeStr_7666 = _arg_1.readInteger();
            _SafeStr_7667 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7668 = _arg_1.readBoolean();
                _SafeStr_7669 = _arg_1.readInteger();
                _SafeStr_7670 = _arg_1.readInteger();
                _SafeStr_7671 = _arg_1.readInteger();
                _SafeStr_7672 = _arg_1.readBoolean();
                _SafeStr_7673 = _arg_1.readBoolean();
            };
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get creationDate():String
        {
            return (_SafeStr_7644);
        }

        public function get achievementScore():int
        {
            return (_achievementScore);
        }

        public function get friendCount():int
        {
            return (_SafeStr_7663);
        }

        public function get isFriend():Boolean
        {
            return (_SafeStr_5879);
        }

        public function get isFriendRequestSent():Boolean
        {
            return (_SafeStr_7664);
        }

        public function get isOnline():Boolean
        {
            return (_SafeStr_7665);
        }

        public function get guilds():Array
        {
            return (_SafeStr_7437);
        }

        public function set isFriendRequestSent(_arg_1:Boolean):void
        {
            _SafeStr_7664 = _arg_1;
        }

        public function get lastAccessSinceInSeconds():int
        {
            return (_SafeStr_7666);
        }

        public function get openProfileWindow():Boolean
        {
            return (_SafeStr_7667);
        }

        public function get accountLevel():int
        {
            return (_SafeStr_7669);
        }

        public function get starGemCount():int
        {
            return (_SafeStr_7671);
        }


    }
}//package _-W1K

// _SafeStr_1479 = "_-hd" (String#9502, DoABC#3)
// _SafeStr_1637 = "_-M5" (String#8021, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4880 = "_-v1" (String#10374, DoABC#3)
// _SafeStr_5879 = "_-5m" (String#6927, DoABC#3)
// _SafeStr_7437 = "_-X1" (String#8762, DoABC#3)
// _SafeStr_7644 = "_-n1G" (String#9859, DoABC#3)
// _SafeStr_7663 = "_-M" (String#7990, DoABC#3)
// _SafeStr_7664 = "_-a1o" (String#8988, DoABC#3)
// _SafeStr_7665 = "_-x1p" (String#10540, DoABC#3)
// _SafeStr_7666 = "_-6b" (String#6995, DoABC#3)
// _SafeStr_7667 = "_-PI" (String#8261, DoABC#3)
// _SafeStr_7668 = "_-L0" (String#7928, DoABC#3)
// _SafeStr_7669 = "_-NK" (String#8096, DoABC#3)
// _SafeStr_7670 = "_-Qu" (String#8334, DoABC#3)
// _SafeStr_7671 = "_-s0" (String#10174, DoABC#3)
// _SafeStr_7672 = "_-S5" (String#8431, DoABC#3)
// _SafeStr_7673 = "_-zP" (String#10692, DoABC#3)



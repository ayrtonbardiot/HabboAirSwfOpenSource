// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Wi._SafeStr_1633

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1633 
    {

        private var _SafeStr_5640:int;
        private var _SafeStr_7714:int;
        private var _SafeStr_7715:String;
        private var _SafeStr_7716:int;
        private var _header:String;
        private var _SafeStr_7717:int;
        private var _SafeStr_7718:int;
        private var _SafeStr_7719:int;
        private var _SafeStr_7720:int;
        private var _SafeStr_7721:String;
        private var _SafeStr_7722:int;
        private var _SafeStr_3734:int;
        private var _SafeStr_7710:int;
        private var _SafeStr_7711:String;
        private var _SafeStr_7723:int;
        private var _SafeStr_7724:Boolean;
        private var _SafeStr_7725:Boolean;


        public static function readFromMessage(_arg_1:IMessageDataWrapper):_SafeStr_1633
        {
            var _local_2:_SafeStr_1633 = new (_SafeStr_1633)();
            _local_2.threadId = _arg_1.readInteger();
            _local_2.threadAuthorId = _arg_1.readInteger();
            _local_2.threadAuthorName = _arg_1.readString();
            _local_2.header = _arg_1.readString();
            _local_2.isSticky = _arg_1.readBoolean();
            _local_2.isLocked = _arg_1.readBoolean();
            _local_2.creationTimeAsSecondsAgo = _arg_1.readInteger();
            _local_2.nMessages = _arg_1.readInteger();
            _local_2.nUnreadMessages = _arg_1.readInteger();
            _local_2.lastMessageId = _arg_1.readInteger();
            _local_2.lastMessageAuthorId = _arg_1.readInteger();
            _local_2.lastMessageAuthorName = _arg_1.readString();
            _local_2.lastMessageTimeAsSecondsAgo = _arg_1.readInteger();
            _local_2.state = _arg_1.readByte();
            _local_2.adminId = _arg_1.readInteger();
            _local_2.adminName = _arg_1.readString();
            _local_2.adminOperationTimeAsSecondsAgo = _arg_1.readInteger();
            return (_local_2);
        }


        public function get adminOperationTimeAsSecondsAgo():int
        {
            return (_SafeStr_7723);
        }

        public function set adminOperationTimeAsSecondsAgo(_arg_1:int):void
        {
            _SafeStr_7723 = _arg_1;
        }

        public function get lastMessageTimeAsSecondsAgo():int
        {
            return (_SafeStr_7722);
        }

        public function set lastMessageTimeAsSecondsAgo(_arg_1:int):void
        {
            _SafeStr_7722 = _arg_1;
        }

        public function get threadId():int
        {
            return (_SafeStr_5640);
        }

        public function set threadId(_arg_1:int):void
        {
            _SafeStr_5640 = _arg_1;
        }

        public function get threadAuthorId():int
        {
            return (_SafeStr_7714);
        }

        public function set threadAuthorId(_arg_1:int):void
        {
            _SafeStr_7714 = _arg_1;
        }

        public function get threadAuthorName():String
        {
            return (_SafeStr_7715);
        }

        public function set threadAuthorName(_arg_1:String):void
        {
            _SafeStr_7715 = _arg_1;
        }

        public function get creationTimeAsSecondsAgo():int
        {
            return (_SafeStr_7716);
        }

        public function set creationTimeAsSecondsAgo(_arg_1:int):void
        {
            _SafeStr_7716 = _arg_1;
        }

        public function get header():String
        {
            return (_header);
        }

        public function set header(_arg_1:String):void
        {
            _header = _arg_1;
        }

        public function get lastMessageId():int
        {
            return (_SafeStr_7719);
        }

        public function set lastMessageId(_arg_1:int):void
        {
            _SafeStr_7719 = _arg_1;
        }

        public function get lastMessageAuthorId():int
        {
            return (_SafeStr_7720);
        }

        public function set lastMessageAuthorId(_arg_1:int):void
        {
            _SafeStr_7720 = _arg_1;
        }

        public function get lastMessageAuthorName():String
        {
            return (_SafeStr_7721);
        }

        public function set lastMessageAuthorName(_arg_1:String):void
        {
            _SafeStr_7721 = _arg_1;
        }

        public function get nMessages():int
        {
            return (_SafeStr_7717);
        }

        public function set nMessages(_arg_1:int):void
        {
            _SafeStr_7717 = _arg_1;
        }

        public function get nUnreadMessages():int
        {
            return (_SafeStr_7718);
        }

        public function set nUnreadMessages(_arg_1:int):void
        {
            _SafeStr_7718 = _arg_1;
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function set state(_arg_1:int):void
        {
            _SafeStr_3734 = _arg_1;
        }

        public function get adminId():int
        {
            return (_SafeStr_7710);
        }

        public function set adminId(_arg_1:int):void
        {
            _SafeStr_7710 = _arg_1;
        }

        public function get adminName():String
        {
            return (_SafeStr_7711);
        }

        public function set adminName(_arg_1:String):void
        {
            _SafeStr_7711 = _arg_1;
        }

        public function get isSticky():Boolean
        {
            return (_SafeStr_7724);
        }

        public function set isSticky(_arg_1:Boolean):void
        {
            _SafeStr_7724 = _arg_1;
        }

        public function get isLocked():Boolean
        {
            return (_SafeStr_7725);
        }

        public function set isLocked(_arg_1:Boolean):void
        {
            _SafeStr_7725 = _arg_1;
        }


    }
}//package _-Wi

// _SafeStr_1633 = "_-XN" (String#8805, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_5640 = "_-lE" (String#9769, DoABC#3)
// _SafeStr_7710 = "_-mG" (String#9826, DoABC#3)
// _SafeStr_7711 = "_-D1U" (String#7424, DoABC#3)
// _SafeStr_7714 = "_-7C" (String#7038, DoABC#3)
// _SafeStr_7715 = "_-xn" (String#10572, DoABC#3)
// _SafeStr_7716 = "_-419" (String#6801, DoABC#3)
// _SafeStr_7717 = "_-Ud" (String#8588, DoABC#3)
// _SafeStr_7718 = "_-Yo" (String#8879, DoABC#3)
// _SafeStr_7719 = "_-Sp" (String#8460, DoABC#3)
// _SafeStr_7720 = "_-Od" (String#8184, DoABC#3)
// _SafeStr_7721 = "_-sc" (String#10227, DoABC#3)
// _SafeStr_7722 = "_-RZ" (String#8379, DoABC#3)
// _SafeStr_7723 = "_-q1b" (String#10055, DoABC#3)
// _SafeStr_7724 = "_-f1g" (String#9342, DoABC#3)
// _SafeStr_7725 = "_-WS" (String#8741, DoABC#3)



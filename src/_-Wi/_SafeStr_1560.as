// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Wi._SafeStr_1560

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1560 
    {

        private var _groupId:int;
        private var _SafeStr_7705:int;
        private var _SafeStr_7706:int;
        private var _SafeStr_7707:int;
        private var _SafeStr_5640:int;
        private var _creationTime:int;
        private var _SafeStr_5806:String;
        private var _SafeStr_7708:String;
        private var _SafeStr_7709:String;
        private var _SafeStr_3734:int;
        private var _SafeStr_7710:int;
        private var _SafeStr_7711:String;
        private var _SafeStr_7712:int;
        private var _SafeStr_7713:int;


        public static function readFromMessage(_arg_1:IMessageDataWrapper):_SafeStr_1560
        {
            var _local_2:_SafeStr_1560 = new (_SafeStr_1560)();
            _local_2.messageId = _arg_1.readInteger();
            _local_2.messageIndex = _arg_1.readInteger();
            _local_2.authorId = _arg_1.readInteger();
            _local_2.authorName = _arg_1.readString();
            _local_2.authorFigure = _arg_1.readString();
            _local_2.creationTimeAsSecondsAgo = _arg_1.readInteger();
            _local_2.messageText = _arg_1.readString();
            _local_2.state = _arg_1.readByte();
            _local_2.adminId = _arg_1.readInteger();
            _local_2.adminName = _arg_1.readString();
            _local_2.adminOperationTimeAsSeccondsAgo = _arg_1.readInteger();
            _local_2.authorPostCount = _arg_1.readInteger();
            return (_local_2);
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

        public function get adminOperationTimeAsSeccondsAgo():int
        {
            return (_SafeStr_7712);
        }

        public function set adminOperationTimeAsSeccondsAgo(_arg_1:int):void
        {
            _SafeStr_7712 = _arg_1;
        }

        public function get MessageId():int
        {
            return (_SafeStr_7705);
        }

        public function set MessageId(_arg_1:int):void
        {
            _SafeStr_7705 = _arg_1;
        }

        public function get creationTime():int
        {
            return (_creationTime);
        }

        public function set creationTime(_arg_1:int):void
        {
            _creationTime = _arg_1;
        }

        public function get authorName():String
        {
            return (_SafeStr_7708);
        }

        public function set authorName(_arg_1:String):void
        {
            _SafeStr_7708 = _arg_1;
        }

        public function get authorFigure():String
        {
            return (_SafeStr_7709);
        }

        public function set authorFigure(_arg_1:String):void
        {
            _SafeStr_7709 = _arg_1;
        }

        public function get threadId():int
        {
            return (_SafeStr_5640);
        }

        public function set threadId(_arg_1:int):void
        {
            _SafeStr_5640 = _arg_1;
        }

        public function get messageId():int
        {
            return (_SafeStr_7705);
        }

        public function set messageId(_arg_1:int):void
        {
            _SafeStr_7705 = _arg_1;
        }

        public function get messageIndex():int
        {
            return (_SafeStr_7706);
        }

        public function set messageIndex(_arg_1:int):void
        {
            _SafeStr_7706 = _arg_1;
        }

        public function set groupID(_arg_1:int):void
        {
            _groupId = _arg_1;
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get authorId():int
        {
            return (_SafeStr_7707);
        }

        public function set authorId(_arg_1:int):void
        {
            _SafeStr_7707 = _arg_1;
        }

        public function get creationTimeAsSecondsAgo():int
        {
            return (_creationTime);
        }

        public function set creationTimeAsSecondsAgo(_arg_1:int):void
        {
            _creationTime = _arg_1;
        }

        public function get messageText():String
        {
            return (_SafeStr_5806);
        }

        public function set messageText(_arg_1:String):void
        {
            _SafeStr_5806 = _arg_1;
        }

        public function get authorPostCount():int
        {
            return (_SafeStr_7713);
        }

        public function set authorPostCount(_arg_1:int):void
        {
            _SafeStr_7713 = _arg_1;
        }


    }
}//package _-Wi

// _SafeStr_1560 = "_-x4" (String#10547, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_5640 = "_-lE" (String#9769, DoABC#3)
// _SafeStr_5806 = "_-F1i" (String#7550, DoABC#3)
// _SafeStr_7705 = "_-SB" (String#8436, DoABC#3)
// _SafeStr_7706 = "_-uv" (String#10368, DoABC#3)
// _SafeStr_7707 = "_-B1S" (String#7309, DoABC#3)
// _SafeStr_7708 = "_-Tp" (String#8533, DoABC#3)
// _SafeStr_7709 = "_-DN" (String#7449, DoABC#3)
// _SafeStr_7710 = "_-mG" (String#9826, DoABC#3)
// _SafeStr_7711 = "_-D1U" (String#7424, DoABC#3)
// _SafeStr_7712 = "_-61P" (String#6946, DoABC#3)
// _SafeStr_7713 = "_-v1U" (String#10387, DoABC#3)



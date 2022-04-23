// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_1647

package _-x1P
{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1647 
    {

        public static const _SafeStr_7770:int = 0;
        public static const _SafeStr_7771:int = 1;
        public static const _SafeStr_7772:int = 2;
        public static const _SafeStr_7773:int = 3;
        public static const _SafeStr_7774:int = 4;
        public static const TYPE_SELFIE:int = 5;
        public static const _SafeStr_7775:int = 6;

        private var _SafeStr_7776:int;
        private var _context:Dictionary = new Dictionary();
        private var _SafeStr_7769:Array = [];

        public function _SafeStr_1647(_arg_1:IMessageDataWrapper)
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_6:int;
            var _local_5:int;
            super();
            _SafeStr_7776 = _arg_1.readByte();
            var _local_2:int = _arg_1.readShort();
            _local_4 = 0;
            while (_local_4 < _local_2)
            {
                _local_3 = _arg_1.readString();
                _local_6 = _arg_1.readByte();
                switch (_local_6)
                {
                    case 0:
                        _context[_local_3] = _arg_1.readBoolean();
                        break;
                    case 1:
                        _context[_local_3] = _arg_1.readInteger();
                        break;
                    case 2:
                        _context[_local_3] = _arg_1.readString();
                        break;
                    default:
                        throw (new Error(("Unknown data type " + _local_6)));
                };
                _local_4++;
            };
            var _local_7:int = _arg_1.readShort();
            _local_5 = 0;
            while (_local_5 < _local_7)
            {
                _SafeStr_7769.push(new _SafeStr_1668(_arg_1));
                _local_5++;
            };
        }

        public function get recordType():int
        {
            return (_SafeStr_7776);
        }

        public function get context():Dictionary
        {
            return (_context);
        }

        public function get chatlog():Array
        {
            return (_SafeStr_7769);
        }

        public function get roomId():int
        {
            return (getInt("roomId"));
        }

        public function get roomName():String
        {
            return (_context["roomName"] as String);
        }

        public function get groupId():int
        {
            return (getInt("groupId"));
        }

        public function get threadId():int
        {
            return (getInt("threadId"));
        }

        public function get messageId():int
        {
            return (getInt("messageId"));
        }

        private function getInt(_arg_1:String):int
        {
            var _local_2:* = _context[_arg_1];
            if (_local_2 == null)
            {
                return (0);
            };
            return (_local_2 as int);
        }


    }
}//package _-x1P

// _SafeStr_1647 = "_-WG" (String#8737, DoABC#3)
// _SafeStr_1668 = "_-kX" (String#9705, DoABC#3)
// _SafeStr_7769 = "_-M1a" (String#8006, DoABC#3)
// _SafeStr_7770 = "_-U1K" (String#8551, DoABC#3)
// _SafeStr_7771 = "_-Nt" (String#8122, DoABC#3)
// _SafeStr_7772 = "_-b1a" (String#9054, DoABC#3)
// _SafeStr_7773 = "_-8R" (String#7129, DoABC#3)
// _SafeStr_7774 = "_-r" (String#10107, DoABC#3)
// _SafeStr_7775 = "_-Ya" (String#8874, DoABC#3)
// _SafeStr_7776 = "_-k1D" (String#9665, DoABC#3)



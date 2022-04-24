// by nota

//_-x1P._SafeStr_1668

package _-x1P
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1668 
    {

        private var _SafeStr_5415:String;
        private var _SafeStr_7778:int;
        private var _SafeStr_7779:String;
        private var _msg:String;
        private var _SafeStr_7780:Boolean;

        public function _SafeStr_1668(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_5415 = _arg_1.readString();
            _SafeStr_7778 = _arg_1.readInteger();
            _SafeStr_7779 = _arg_1.readString();
            _msg = _arg_1.readString();
            _SafeStr_7780 = _arg_1.readBoolean();
        }

        public function get timeStamp():String
        {
            return (_SafeStr_5415);
        }

        public function get chatterId():int
        {
            return (_SafeStr_7778);
        }

        public function get chatterName():String
        {
            return (_SafeStr_7779);
        }

        public function get msg():String
        {
            return (_msg);
        }

        public function get hasHighlighting():Boolean
        {
            return (_SafeStr_7780);
        }


    }
}//package _-x1P

// _SafeStr_1668 = "_-kX" (String#9705, DoABC#3)
// _SafeStr_5415 = "_-f15" (String#9323, DoABC#3)
// _SafeStr_7778 = "_-Hn" (String#7710, DoABC#3)
// _SafeStr_7779 = "_-N1a" (String#8071, DoABC#3)
// _SafeStr_7780 = "_-q1V" (String#10052, DoABC#3)



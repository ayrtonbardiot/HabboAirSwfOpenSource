// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-21f._SafeStr_1586

package _-21f
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1586 
    {

        private var _flatId:int;
        private var _SafeStr_7014:int;
        private var _SafeStr_4204:String;
        private var _caption:String;

        public function _SafeStr_1586(_arg_1:IMessageDataWrapper)
        {
            _flatId = _arg_1.readInteger();
            _SafeStr_7014 = _arg_1.readInteger();
            _SafeStr_4204 = _arg_1.readString();
            _caption = _arg_1.readString();
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get areaId():int
        {
            return (_SafeStr_7014);
        }

        public function get image():String
        {
            return (_SafeStr_4204);
        }

        public function get caption():String
        {
            return (_caption);
        }


    }
}//package _-21f

// _SafeStr_1586 = "_-G1J" (String#7592, DoABC#3)
// _SafeStr_4204 = "_-WT" (String#8742, DoABC#3)
// _SafeStr_7014 = "_-dt" (String#9251, DoABC#3)



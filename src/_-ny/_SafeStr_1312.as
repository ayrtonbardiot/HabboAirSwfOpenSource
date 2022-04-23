// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-ny._SafeStr_1312

package _-ny
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1312 implements IMessageParser 
    {

        private var _SafeStr_7058:int;
        private var _SafeStr_7455:int;


        public function get resultCode():int
        {
            return (_SafeStr_7058);
        }

        public function get millisToAllowProcessReset():int
        {
            return (_SafeStr_7455);
        }

        public function flush():Boolean
        {
            _SafeStr_7058 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7058 = _arg_1.readInteger();
            _SafeStr_7455 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-ny

// _SafeStr_1312 = "_-vh" (String#10422, DoABC#3)
// _SafeStr_7058 = "_-t1u" (String#10267, DoABC#3)
// _SafeStr_7455 = "_-G1c" (String#7601, DoABC#3)



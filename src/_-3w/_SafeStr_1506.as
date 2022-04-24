// by nota

//_-3w._SafeStr_1506

package _-3w
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1506 implements IMessageParser 
    {

        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;
        private var _SafeStr_4049:uint;


        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get dir():uint
        {
            return (_SafeStr_4049);
        }

        public function flush():Boolean
        {
            _SafeStr_4050 = 0;
            _SafeStr_4051 = 0;
            _SafeStr_4049 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4050 = _arg_1.readInteger();
            _SafeStr_4051 = _arg_1.readInteger();
            _SafeStr_4049 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-3w

// _SafeStr_1506 = "_-t1t" (String#10266, DoABC#3)
// _SafeStr_4049 = "_-W12" (String#8660, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)



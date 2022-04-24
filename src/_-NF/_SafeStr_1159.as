// by nota

//_-NF._SafeStr_1159

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Zz._SafeStr_1573;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1159 implements IMessageParser 
    {

        public static const _SafeStr_7438:int = 16;

        private var _SafeStr_6429:int;
        private var _SafeStr_7439:int;
        private var _SafeStr_5316:_SafeStr_1573;


        public function flush():Boolean
        {
            _SafeStr_5316 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6429 = _arg_1.readInteger();
            _SafeStr_7439 = _arg_1.readInteger();
            _SafeStr_5316 = new _SafeStr_1573(_arg_1);
            return (true);
        }

        public function get petOwnerId():int
        {
            return (_SafeStr_7439);
        }

        public function get respect():int
        {
            return (_SafeStr_6429);
        }

        public function get petData():_SafeStr_1573
        {
            return (_SafeStr_5316);
        }

        public function isTreat():Boolean
        {
            return (_SafeStr_5316.typeId == 16);
        }


    }
}//package _-NF

// _SafeStr_1159 = "_-pS" (String#10010, DoABC#3)
// _SafeStr_1573 = "_-iW" (String#9562, DoABC#3)
// _SafeStr_5316 = "_-k1l" (String#9685, DoABC#3)
// _SafeStr_6429 = "_-x0" (String#10501, DoABC#3)
// _SafeStr_7438 = "_-2C" (String#6688, DoABC#3)
// _SafeStr_7439 = "_-c1Z" (String#9118, DoABC#3)



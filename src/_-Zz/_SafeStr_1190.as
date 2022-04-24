// by nota

//_-Zz._SafeStr_1190

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1190 implements IMessageParser 
    {

        private var _SafeStr_6139:int;
        private var _SafeStr_4258:int;


        public function flush():Boolean
        {
            _SafeStr_6139 = 0;
            _SafeStr_4258 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6139 = _arg_1.readInteger();
            _SafeStr_4258 = _arg_1.readInteger();
            return (true);
        }

        public function get breedingNestStuffId():int
        {
            return (_SafeStr_6139);
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }


    }
}//package _-Zz

// _SafeStr_1190 = "_-M1u" (String#8017, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_6139 = "_-11Y" (String#6546, DoABC#3)



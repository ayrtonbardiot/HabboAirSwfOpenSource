// by nota

//_-kC._SafeStr_1421

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1421 implements IMessageParser 
    {

        private var _SafeStr_4258:int;


        public function get result():int
        {
            return (_SafeStr_4258);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-kC

// _SafeStr_1421 = "_-51B" (String#6876, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)



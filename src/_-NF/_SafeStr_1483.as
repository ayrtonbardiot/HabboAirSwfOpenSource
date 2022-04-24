// by nota

//_-NF._SafeStr_1483

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1483 implements IMessageParser 
    {

        public static const _SafeStr_7451:int = 0;
        public static const _SafeStr_7452:int = 1;

        private var _status:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _status = _arg_1.readInteger();
            return (true);
        }

        public function get status():int
        {
            return (_status);
        }


    }
}//package _-NF

// _SafeStr_1483 = "_-OO" (String#8177, DoABC#3)
// _SafeStr_7451 = "_-xT" (String#10560, DoABC#3)
// _SafeStr_7452 = "_-12K" (String#6567, DoABC#3)



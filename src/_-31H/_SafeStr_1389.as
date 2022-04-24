// by nota

//_-31H._SafeStr_1389

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1389 implements IMessageParser 
    {

        public static const _SafeStr_7056:int = 0;
        public static const _SafeStr_7057:int = 1;

        private var _SafeStr_7058:int;
        private var _SafeStr_7059:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7058 = _arg_1.readInteger();
            this._SafeStr_7059 = _arg_1.readInteger();
            return (true);
        }

        public function get resultCode():int
        {
            return (_SafeStr_7058);
        }

        public function get roomLimit():int
        {
            return (_SafeStr_7059);
        }


    }
}//package _-31H

// _SafeStr_1389 = "_-X1J" (String#8772, DoABC#3)
// _SafeStr_7056 = "_-Qj" (String#8331, DoABC#3)
// _SafeStr_7057 = "_-gY" (String#9429, DoABC#3)
// _SafeStr_7058 = "_-t1u" (String#10267, DoABC#3)
// _SafeStr_7059 = "_-B18" (String#7304, DoABC#3)



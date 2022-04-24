// by nota

//_-g1G._SafeStr_1072

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1072 implements IMessageParser 
    {

        private var _SafeStr_7238:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7238 = _arg_1.readInteger();
            return (true);
        }

        public function get furniCount():int
        {
            return (_SafeStr_7238);
        }


    }
}//package _-g1G

// _SafeStr_1072 = "_-iS" (String#9560, DoABC#3)
// _SafeStr_7238 = "_-U9" (String#8569, DoABC#3)



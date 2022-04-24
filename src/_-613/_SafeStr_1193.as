// by nota

//_-613._SafeStr_1193

package _-613
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1193 implements IMessageParser 
    {

        private var _SafeStr_7098:int;
        private var _SafeStr_4258:Boolean;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7098 = _arg_1.readByte();
            _SafeStr_4258 = _arg_1.readBoolean();
            return (true);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function get rewardCategory():int
        {
            return (_SafeStr_7098);
        }

        public function get result():Boolean
        {
            return (_SafeStr_4258);
        }


    }
}//package _-613

// _SafeStr_1193 = "_-r1x" (String#10143, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_7098 = "_-Z1i" (String#8907, DoABC#3)



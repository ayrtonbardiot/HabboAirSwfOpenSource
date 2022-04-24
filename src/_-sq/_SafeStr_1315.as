// by nota

//_-sq._SafeStr_1315

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1315 implements IMessageParser 
    {

        private var _SafeStr_7527:int;


        public function flush():Boolean
        {
            _SafeStr_7527 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7527 = _arg_1.readInteger();
            return (true);
        }

        public function get timeToStageEnd():int
        {
            return (_SafeStr_7527);
        }


    }
}//package _-sq

// _SafeStr_1315 = "_-s1u" (String#10205, DoABC#3)
// _SafeStr_7527 = "_-cE" (String#9136, DoABC#3)



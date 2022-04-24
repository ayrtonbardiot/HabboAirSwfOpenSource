// by nota

//_-sq._SafeStr_1386

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1386 implements IMessageParser 
    {

        private var _SafeStr_5722:int;


        public function flush():Boolean
        {
            _SafeStr_5722 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5722 = _arg_1.readInteger();
            return (true);
        }

        public function get gameType():int
        {
            return (_SafeStr_5722);
        }


    }
}//package _-sq

// _SafeStr_1386 = "_-l1t" (String#9758, DoABC#3)
// _SafeStr_5722 = "_-A1H" (String#7218, DoABC#3)



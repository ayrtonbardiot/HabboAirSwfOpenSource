// by nota

//_-NF._SafeStr_1060

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1060 implements IMessageParser 
    {

        private var _SafeStr_7434:int = -1;
        private var _SafeStr_7435:int = 0;


        public function get giverUserId():int
        {
            return (_SafeStr_7434);
        }

        public function get handItemType():int
        {
            return (_SafeStr_7435);
        }

        public function flush():Boolean
        {
            _SafeStr_7434 = -1;
            _SafeStr_7435 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7434 = _arg_1.readInteger();
            _SafeStr_7435 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-NF

// _SafeStr_1060 = "_-N1z" (String#8083, DoABC#3)
// _SafeStr_7434 = "_-t1K" (String#10250, DoABC#3)
// _SafeStr_7435 = "_-4E" (String#6844, DoABC#3)



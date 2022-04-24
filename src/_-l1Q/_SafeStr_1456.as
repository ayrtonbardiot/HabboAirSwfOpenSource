// by nota

//_-l1Q._SafeStr_1456

package _-l1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1456 implements IMessageParser 
    {

        private var _SafeStr_5886:int = 0;


        public function get seconds():int
        {
            return (_SafeStr_5886);
        }

        public function flush():Boolean
        {
            _SafeStr_5886 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_5886 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1Q

// _SafeStr_1456 = "_-5G" (String#6909, DoABC#3)
// _SafeStr_5886 = "_-i1n" (String#9539, DoABC#3)



// by nota

//_-a1d._SafeStr_1083

package _-a1d
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1083 implements IMessageParser 
    {

        private var _SafeStr_7133:Boolean;
        private var _SafeStr_5259:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5259 = _arg_1.readInteger();
            _SafeStr_7133 = _arg_1.readBoolean();
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_5259 = 0;
            _SafeStr_7133 = false;
            return (true);
        }

        public function get count():int
        {
            return (_SafeStr_5259);
        }

        public function get recipeComplete():Boolean
        {
            return (_SafeStr_7133);
        }


    }
}//package _-a1d

// _SafeStr_1083 = "_-BV" (String#7336, DoABC#3)
// _SafeStr_5259 = "_-61s" (String#6975, DoABC#3)
// _SafeStr_7133 = "_-71Z" (String#7022, DoABC#3)



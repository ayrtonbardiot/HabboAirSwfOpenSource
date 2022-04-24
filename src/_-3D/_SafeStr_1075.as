// by nota

//_-3D._SafeStr_1075

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1075 implements IMessageParser 
    {

        private var _SafeStr_3734:int;
        private var _SafeStr_6279:int;
        private var _SafeStr_6994:int;


        public function flush():Boolean
        {
            _SafeStr_3734 = -1;
            _SafeStr_6279 = -1;
            _SafeStr_6994 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3734 = _arg_1.readInteger();
            _SafeStr_6279 = _arg_1.readInteger();
            _SafeStr_6994 = _arg_1.readInteger();
            return (true);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get userCount():int
        {
            return (_SafeStr_6279);
        }

        public function get userCountGoal():int
        {
            return (_SafeStr_6994);
        }


    }
}//package _-3D

// _SafeStr_1075 = "_-a12" (String#8957, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_6279 = "_-tN" (String#10281, DoABC#3)
// _SafeStr_6994 = "_-g11" (String#9384, DoABC#3)



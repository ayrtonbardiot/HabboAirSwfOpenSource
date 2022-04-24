// by nota

//_-k1x._SafeStr_1170

package _-k1x
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1170 implements IMessageParser 
    {

        private var _flatId:int = 0;
        private var _SafeStr_5021:int = 0;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            this._flatId = _arg_1.readInteger();
            this._SafeStr_5021 = _arg_1.readInteger();
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get roomControllerLevel():int
        {
            return (_SafeStr_5021);
        }


    }
}//package _-k1x

// _SafeStr_1170 = "_-Mm" (String#8039, DoABC#3)
// _SafeStr_5021 = "_-2V" (String#6694, DoABC#3)



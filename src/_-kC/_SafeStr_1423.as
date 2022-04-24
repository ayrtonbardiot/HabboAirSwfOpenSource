// by nota

//_-kC._SafeStr_1423

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1423 implements IMessageParser 
    {

        private var _offerId:int;
        private var _SafeStr_5449:Boolean;


        public function get success():Boolean
        {
            return (_SafeStr_5449);
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _offerId = _arg_1.readInteger();
            _SafeStr_5449 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-kC

// _SafeStr_1423 = "_-X2" (String#8788, DoABC#3)
// _SafeStr_5449 = "_-od" (String#9957, DoABC#3)



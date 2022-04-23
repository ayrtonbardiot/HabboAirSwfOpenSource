// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1223

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1541;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1223 implements IMessageParser 
    {

        private var _offer:_SafeStr_1541;


        public function flush():Boolean
        {
            _offer = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _offer = new _SafeStr_1541(_arg_1);
            return (true);
        }

        public function offer():_SafeStr_1541
        {
            return (_offer);
        }


    }
}//package _-g1G

// _SafeStr_1223 = "_-91H" (String#7161, DoABC#3)
// _SafeStr_1541 = "_-51r" (String#6898, DoABC#3)



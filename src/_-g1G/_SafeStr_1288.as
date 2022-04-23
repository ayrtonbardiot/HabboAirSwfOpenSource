// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1288

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1563;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1288 implements IMessageParser 
    {

        private var _offer:_SafeStr_1563;


        public function get offer():_SafeStr_1563
        {
            return (_offer);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _offer = new _SafeStr_1563(_arg_1);
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1288 = "_-q12" (String#10031, DoABC#3)
// _SafeStr_1563 = "_-T2" (String#8503, DoABC#3)



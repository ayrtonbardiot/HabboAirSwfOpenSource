// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1255

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1255 implements IMessageParser 
    {

        private var _offerId:int;
        private var _SafeStr_7242:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _offerId = _arg_1.readInteger();
            _SafeStr_7242 = _arg_1.readBoolean();
            return (true);
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get isGiftable():Boolean
        {
            return (_SafeStr_7242);
        }


    }
}//package _-g1G

// _SafeStr_1255 = "_-n4" (String#9891, DoABC#3)
// _SafeStr_7242 = "_-11h" (String#6553, DoABC#3)



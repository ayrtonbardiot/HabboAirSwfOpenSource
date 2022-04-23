// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1217

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1217 implements IMessageParser 
    {

        private var _expiryTime:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _expiryTime = _arg_1.readInteger();
            return (true);
        }

        public function get expiryTime():int
        {
            return (_expiryTime);
        }


    }
}//package _-z1k

// _SafeStr_1217 = "_-w1N" (String#10450, DoABC#3)



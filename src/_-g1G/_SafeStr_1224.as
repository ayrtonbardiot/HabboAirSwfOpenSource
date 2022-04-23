// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1224

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1224 implements IMessageParser 
    {

        private var _SafeStr_7053:String = "";


        public function flush():Boolean
        {
            _SafeStr_7053 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7053 = _arg_1.readString();
            return (true);
        }

        public function get errorCode():String
        {
            return (_SafeStr_7053);
        }


    }
}//package _-g1G

// _SafeStr_1224 = "_-Ue" (String#8589, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)



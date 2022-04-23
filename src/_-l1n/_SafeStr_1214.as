// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1n._SafeStr_1214

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1214 implements IMessageParser 
    {

        private var _SafeStr_6138:Boolean = false;


        public function get isPlaying():Boolean
        {
            return (_SafeStr_6138);
        }

        public function flush():Boolean
        {
            _SafeStr_6138 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6138 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-l1n

// _SafeStr_1214 = "_-ie" (String#9567, DoABC#3)
// _SafeStr_6138 = "_-eq" (String#9316, DoABC#3)



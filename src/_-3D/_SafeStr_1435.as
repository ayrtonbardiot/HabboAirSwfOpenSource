// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-3D._SafeStr_1435

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1435 implements IMessageParser 
    {

        private var _SafeStr_7066:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7066 = _arg_1.readBoolean();
            return (true);
        }

        public function get expired():Boolean
        {
            return (_SafeStr_7066);
        }


    }
}//package _-3D

// _SafeStr_1435 = "_-S1X" (String#8411, DoABC#3)
// _SafeStr_7066 = "_-yw" (String#10650, DoABC#3)


